#! /usr/bin/env bash

hisatD='/sciclone/home20/dthomas01/hisat2-2.1.0'
fastaFolder='/sciclone/data10/dthomas01/MimRNAseq_fastq'
refFolder='/sciclone/data10/dthomas01/Mll_hisat'

cd $refFolder

touch align.log

for i in $fastaFolder/*; do
    echo $i
    aa=${i##*/}  
    bb=${aa%.*}
    sa=$bb".sam"
    $hisatD/hisat2 -x mllGen -U $i -S $sa --dta | tee -a align.log
done

