#!/usr/bin/env bash
#PBS -l walltime=8:00:00
#PBS -N rnaAlignmentsApr23.1030am
#PBS -l nodes=1:ppn=8

cd /sciclone/data10/dthomas01/rnaseq

hisat2="/sciclone/data10/dthomas01/hisat2-2.1.0"
mllGen='/sciclone/data10/dthomas01/rnaseq/mimLuteus_genome.fa'
mllHiSatInd='/sciclone/data10/dthomas01/rnaseq/mllHiSat2Indices'
rnaFastq='/sciclone/data10/dthomas01/rnaseq/MimRNAseq_fastq'
aligned2Mll='/sciclone/data10/dthomas01/rnaseq/aligned2Mll'

cd $rnaFastq

for i in *; do
    echo $i
    j=${i/.fastq/_aligned.sam}
    echo $j
    $hisat2/hisat2 -p 8 -x $mllHiSatInd"/mllInd" -U $i -S $aligned2Mll/$j
    echo $aligned2Mll/$j
done

