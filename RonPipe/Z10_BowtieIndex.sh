## Index a fasta file(s).  Should be done prior to running bowtie to align reads.
##
## Ron Smith - 2/13/2017
##
## ---------------------------------------------------------------------------

## Path to the fasta file(s) (without the file extension)
REF_M11_CG=/Volumes/Ron/3894/Ref/M11_CG_CDS
REF_M11_C5=/Volumes/Ron/3894/Ref/M11_C5_CDS

## Index the fasta file (run multiple simultaneously using &)
bowtie2-build $REF_M11_CG.fa $REF_M11_CG &
bowtie2-build $REF_M11_C5.fa $REF_M11_C5