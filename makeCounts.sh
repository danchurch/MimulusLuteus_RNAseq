#!/usr/bin/env bash

## bam directory is:
bamDir=/Users/danthomas/Documents/RNAi_Mvar_RNAseq/MimulusLuteus_RNAseq/BAMs
## our gff file from CoGe is symlinked here:
GFF=/Users/danthomas/Documents/RNAi_Mvar_RNAseq/MimulusLuteus_RNAseq/lutRefGenome/Mimulus_luteus_complete_w_single_exons_standard_renamed_genes.gff

cd $bamDir

for i in  $bamDir/*; do
    echo $i "   " ${i/sorted\.bam/HTSeqCounts.txt}
    htseq-count -f bam -t exon -i Parent -s no $i $GFF \
            > ${i/sorted\.bam/HTSeqCounts.txt}
done

