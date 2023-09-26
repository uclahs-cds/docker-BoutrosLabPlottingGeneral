# Changelog
All notable changes to the tool_name Docker file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]
### Changed
- Update `README.md`
- Update `metadata.yaml`
- Update builder image to mambaforge
- Switch to GitHub Packages registry in `CICD-base.yaml`
- Update `metadata.yaml` and `PULL_REQUEST_TEMPLATE.md` and replace Docker Hub with GitHub Packages in the template

## Added
- Add `pkgdepends` to recursively install BPG and its dependencies
- Add R wrapper `install_bpg.R` to install BPG from GitHub repo
- Add `install_bpg.R` to `Dockerfile`
- Add `Docker-build-release.yaml`
- Add `image_name` to `metadata.yaml`
