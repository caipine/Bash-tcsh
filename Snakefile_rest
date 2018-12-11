include: "rules/common.smk"

##### Target rules #####

rule all:
    input:
        "annotated/all.vcf.gz",
        "qc/multiqc.html",
        "tables/calls.tsv.gz",
        "plots/depths.svg",
        "plots/allele-freqs.svg"


##### Modules #####

include: "rules/mapping.smk"
include: "rules/calling_rest.smk"
include: "rules/filtering.smk"
include: "rules/stats.smk"
include: "rules/qc.smk"
include: "rules/annotation.smk"
