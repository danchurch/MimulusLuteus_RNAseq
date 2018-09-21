#! /usr/bin/env bash
fastaFolder="/Users/danthomas/Documents/RNAi_Mvar_RNAseq/Mlv_raw_unzipped"
cd $fastaFolder

for i in *; do
    echo ${i%fastq}_qa.pdf
    htseq-qa -t fastq --nosplit --outfile ${i%fastq}_qa.pdf $i
done
