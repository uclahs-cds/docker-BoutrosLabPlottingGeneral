ARG MINIFORGE_VERSION=23.1.0-4
ARG BPG_VERSION=7.0.8

FROM condaforge/mambaforge:${MINIFORGE_VERSION} AS builder

# Deploy the target tools into a base image
FROM ubuntu:20.04
COPY --from=builder /usr/local /usr/local

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    gfortran \
    r-base \
    r-base-dev \
    r-cran-curl \
    r-cran-rgl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install latest BPG, it's dependencies and some house-keeping packages
RUN R -q -e 'install.packages(c("deldir", "Rcpp", "interp", "latticeExtra", "cluster", "hexbin","BoutrosLab.plotting.general", "dplyr", "optparse", "argparse", "reshape"))'

RUN R -q -e 'install.packages(c("deldir", "Rcpp", "interp", "latticeExtra", "cluster", "hexbin")' && \
    R -q -e 'install_version("BoutrosLab.plotting.general", ${BPG_VERSION})' && \
    R -q -e 'install.packages(c("argparse", "dplyr", "optparse", "reshape"))'

# Add a new user/group called bldocker
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

# Change the default user to bldocker from root
USER bldocker

LABEL   maintainer="Mohammed Faizal Eeman Mootor <mmootor@mednet.ucla.edu>" \
        org.opencontainers.image.source=https://github.com/uclahs-cds/docker-BoutrosLabPlottingGeneral
