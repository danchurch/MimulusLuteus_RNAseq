#!/usr/bin/env bash
#PBS -l walltime=8:00:00
#PBS -N sams2Bams
#PBS -l nodes=1:ppn=8

export PATH=/sciclone/data10/dthomas01/samtools/bin:$PATH

sams='/sciclone/data10/dthomas01/rnaseq/aligned2Mll/sam'
bams='/sciclone/data10/dthomas01/rnaseq/aligned2Mll/bam'

for i in $sams/*; do
    echo $i
    j=${i/aligned.sam/aligned_sorted.bam}
    k=${j/sam/bam}
    samtools sort -@ 8 -o $k $i
    echo $k
done


