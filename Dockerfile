ARG MINIFORGE_VERSION=23.1.0-4
ARG BPG_VERSION=7.0.8

FROM condaforge/mambaforge:${MINIFORGE_VERSION} AS builder

# Deploy the target tools into a base image
FROM ubuntu:20.04
COPY --from=builder /usr/local /usr/local

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libxml2 \
    libxml2-dev \
    libcurl4-gnutls-dev \
    build-essential \
    r-base \
    r-base-dev \
    gfortran \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    r-cran-rgl \
    git \
    libssl-dev \
    r-cran-curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install latest BPG, it's dependencies and some house-keeping packages
COPY install_bpg.R /usr/local/bin/install_bpg.R

RUN R -q -e 'install.packages(c("argparse", "dplyr", "optparse", "reshape"))' && \
    R -q -e 'install.packages(c("deldir", "Rcpp", "interp", "latticeExtra", "cluster", "hexbin")' && \
    chmod +x /usr/local/bin/install_bpg.R && \
    Rscript /usr/local/bin/install_bpg.R ${BPG_VERSION}

# Add a new user/group called bldocker
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

# Change the default user to bldocker from root
USER bldocker

LABEL   maintainer="Mohammed Faizal Eeman Mootor <mmootor@mednet.ucla.edu>" \
        org.opencontainers.image.source=https://github.com/uclahs-cds/docker-BoutrosLabPlottingGeneral
