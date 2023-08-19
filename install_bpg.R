library(argparse);
parser <- ArgumentParser();

parser$add_argument(
    '-av',
    '--add-version',
    help = 'Specify version of BPG to download'
    );

args <- parser$parse_args();

bpg.version <- args$add_version;

if (!(startsWith(bpg.version, 'v'))) {
    bpg.version <- paste('v', bpg.version, sep = '')
    };

devtools::install_github(
    repo = 'uclahs-cds/public-R-BoutrosLab-plotting-general',
    ref = bpg.version
    );
