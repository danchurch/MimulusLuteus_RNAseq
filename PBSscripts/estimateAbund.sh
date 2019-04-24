#!/usr/bin/env bash
#PBS -l walltime=4:00:00
#PBS -N estimateAbund
#PBS -l nodes=1:ppn=8

export PATH=/sciclone/data10/dthomas01/stringtie:$PATH

cd /sciclone/data10/dthomas01/

assTrans='/sciclone/data10/dthomas01/rnaseq/aligned2Mll/mergedTranscripts.gtf'
bams="/sciclone/data10/dthomas01/rnaseq/aligned2Mll/bam"
abundances="/sciclone/data10/dthomas01/rnaseq/aligned2Mll/abundances"

for i in $bams/*; do
    j=$(basename $i)
    k=${j/_aligned_sorted.bam/_abundances.gtf}
    l=$abundances/$k
    echo $i
    stringtie -e -B -p 8 -G $assTrans -o $l $i
    echo $l
done

