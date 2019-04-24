#!/usr/bin/env bash
#PBS -l walltime=6:00:00
#PBS -N combineTrans
#PBS -l nodes=1:ppn=8

export PATH=/sciclone/data10/dthomas01/stringtie:$PATH

assembledTranscripts='/sciclone/data10/dthomas01/rnaseq/aligned2Mll/assembledTranscripts'
mergedTranscripts='/sciclone/data10/dthomas01/rnaseq/aligned2Mll/mergedTranscripts.gtf'
mergelist='/sciclone/home20/dthomas01/mergelist.txt'

cd $assembledTranscripts

stringtie --merge -p 8 -o $mergedTranscripts $mergelist

