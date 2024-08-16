# docker-BoutrosLabPlottingGeneral
Docker image for Boutros Lab Plotting General R package that can be used in pipelines to generate publication quality plots.

# Documentation

Boutros Lab Plotting General [here](https://cran.rstudio.com/web/packages/BoutrosLab.plotting.general/)

Docker introduction [here](https://uclahs-cds.atlassian.net/wiki/spaces/BOUTROSLAB/pages/3190419/Docker+Introduction)

Dockerfile Best Practices [here](https://uclahs-cds.atlassian.net/wiki/spaces/BOUTROSLAB/pages/3189770/Dockerfile+Best+Practices)

Docker image versioning standard [here](https://uclahs-cds.atlassian.net/wiki/spaces/BOUTROSLAB/pages/3188472/Docker+image+versioning+standardization)


# Version
The current image `v7.1.0` is built with R `v4.4.0`.

| R Packages | Version | Type |
|------|---------|---------|
| BoutrosLab.plotting.general | `7.1.0` | main |
| argparse | `latest` from CRAN | dependency |
| pkgdepends | `latest` from CRAN | dependency |
| dplyr | `latest` from CRAN | optional |
| naturalsort | `latest` from CRAN | optional |
| optparse | `latest` from CRAN | optional |
| reshape | `latest` from CRAN | optional |

The Dockerfile in this repo utilizes an R package, `pkgdepends` to recursively install all dependencies and `BoutrosLab.plotting.general`. The `pkgdepends` workflow is in the R script, `install_bpg`.

---

## Discussions

- [Issue tracker](https://github.com/uclahs-cds/docker-BoutrosLabPlottingGeneral/issues) to report errors and enhancement ideas.
- Discussions can take place in [docker-BoutrosLabPlottingGeneral Discussions](https://github.com/uclahs-cds/docker-BoutrosLabPlottingGeneral/discussions)
- [docker-BoutrosLabPlottingGeneral pull requests](https://github.com/uclahs-cds/docker-BoutrosLabPlottingGeneral/pulls) are also open for discussion

---

## Contributors

Please see list of [Contributors](https://github.com/uclahs-cds/docker-BoutrosLabPlottingGeneral/graphs/contributors) at GitHub.

---

## References

1. P’ng, C., Green, J., Chong, L.C. et al. BPG: Seamless, automated and interactive visualization of scientific data. BMC Bioinformatics 20, 42 (2019). https://doi.org/10.1186/s12859-019-2610-2

---

## License

Author: Mohammed Faizal Eeman Mootor

docker-BoutrosLabPlottingGeneral is licensed under the GNU General Public License version 2. See the file LICENSE for the terms of the GNU GPL license.

docker-BoutrosLabPlottingGeneral can be used to create a docker instance of the Boutros Lab Plotting General.

Copyright (C) 2023-2024 University of California Los Angeles ("Boutros Lab") All rights reserved.

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
