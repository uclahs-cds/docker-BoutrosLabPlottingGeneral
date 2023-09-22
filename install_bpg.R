library(argparse);
library(pkgdepends);

parser <- ArgumentParser();

parser$add_argument(
    '-r',
    '--repo-name',
    help = 'Specify BPG GitHub repo name'
    );
parser$add_argument(
    '-av',
    '--add-version',
    help = 'Specify version of BPG to download'
    );

args <- parser$parse_args();

bpg.repo <- args$repo_name;
bpg.version <- args$add_version;

if (!(startsWith(bpg.version, 'v'))) {
    bpg.version <- paste('v', bpg.version, sep = '')
    };

bpg <- paste(bpg.repo, '@' ,bpg.version, sep = '');

pkg.download.proposal <- new_pkg_download_proposal(bpg);
pkg.download.proposal$resolve();
pkg.download.proposal$download();

#Packages and dependencies will be installed in the path below
lib <- '/usr/lib/R/site-library';
config <- list(library = lib);

pkg.installation.proposal <- new_pkg_installation_proposal(
  bpg,
  config = list(library = lib)
);
pkg.installation.proposal$solve();
pkg.installation.proposal$download();
pkg.installation.proposal$install();
