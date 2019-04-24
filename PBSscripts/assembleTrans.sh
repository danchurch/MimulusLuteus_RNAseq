#!/usr/bin/env bash
#PBS -l walltime=6:00:00
#PBS -N assembleTrans
#PBS -l nodes=1:ppn=8

cd /sciclone/data10/dthomas01

export PATH=/sciclone/data10/dthomas01/stringtie:$PATH

bams='/sciclone/data10/dthomas01/rnaseq/aligned2Mll/bam'
assembledTranscripts='/sciclone/data10/dthomas01/rnaseq/aligned2Mll/assembledTranscripts'
for i in $bams/*; do
    echo $i
    j=$(basename ${i/aligned_sorted.bam/transcripts.gtf})
    k=$assembledTranscripts"/"$j
    stringtie -p 8 -o $k $i
    echo $k
done

