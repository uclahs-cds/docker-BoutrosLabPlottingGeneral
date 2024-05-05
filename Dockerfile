# Deploy the target tools into a base image
FROM ubuntu:20.04

ARG BPG_REPO='uclahs-cds/package-BoutrosLab-plotting-general'
ARG BPG_VERSION=7.1.0
ARG R_BASE_VERSION=4.4.0-1.2004.0
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    software-properties-common \
    dirmngr \
    build-essential \
    gfortran \
    libcurl4-gnutls-dev \
    libharfbuzz-dev \
    libssl-dev \
    libxml2 \
    libxml2-dev \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
# add the R 4.4 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc \
    && add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" \
    && apt-get install -y --no-install-recommends \
    r-base=${R_BASE_VERSION} \
    r-base-dev=${R_BASE_VERSION} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install latest BPG, it's dependencies and some house-keeping packages
COPY install_bpg.R /usr/local/bin/install_bpg.R

RUN R -q -e 'install.packages(c("argparse", "dplyr", "naturalsort", "optparse", "pkgdepends", "reshape"), lib = "/usr/lib/R/site-library")' && \
    chmod +x /usr/local/bin/install_bpg.R && \
    Rscript /usr/local/bin/install_bpg.R -r ${BPG_REPO} -av ${BPG_VERSION}

# Add a new user/group called bldocker
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

# Change the default user to bldocker from root
USER bldocker

LABEL maintainer="Mohammed Faizal Eeman Mootor <mmootor@mednet.ucla.edu>" \
        org.opencontainers.image.source=https://github.com/uclahs-cds/docker-BoutrosLabPlottingGeneral
