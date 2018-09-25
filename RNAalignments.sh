#! /usr/bin/env bash
hisatD='/Users/danthomas/hisat2-2.1.0'
fastaFolder="/Users/danthomas/Documents/RNAi_Mvar_RNAseq/Mlv_raw_unzipped"
wd="/Users/danthomas/Documents/RNAi_Mvar_RNAseq/MimulusLuteus_RNAseq"
refFolder='/Users/danthomas/Documents/RNAi_Mvar_RNAseq/MimulusLuteus_RNAseq/lutRefGenome'

cd $refFolder
touch align.log

for i in $fastaFolder/*; do
    echo $i
    aa=${i##*/}
    bb=${aa%.*}
    sa=$bb".sam"
    $hisatD/hisat2 -x mllGen -U $i -S $sa | tee -a align.log
done

