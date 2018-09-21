## Merge BAM files.  Meant to be used on sequencing data from 
## 2 different lanes (i.e. L001 and L002 files). Files should already be sorted.
##
## Ron Smith - 2/13/2017
## rdsmith@email.wm.edu
##
## ------------------------------------------------------------------------


## ----- Settings ---------------------------------------------------------
## Path to main project directory
MAIN=/Volumes/Ron/3894

## Path to SAM files
SAM=$MAIN/SAMBAM

## Path to backup original BAM files
BAK=$MAIN/BAK

## Name of a log file
LOG=$MAIN/Log_Z40_SamtoolsMerge.txt
## ----- End of settings ---------------------------------------------------


## Ensure backup directory exists
mkdir $BAK

## Start log file (overwrite existing)
echo 'Starting : ' $(date) > $LOG

## Loop through all the BAM files containing L001 in the file name
for file1 in $SAM/*L001*.bam; do
    
    ## The second file is like the first, with L002 instead
    file2=${file1/L001/L002}
    
    ## Output will have the same file name less the L00x part
    outfile=${file1/_L001_/_}
    
    ## Add .merged to the output file name
    outfile=${outfile/.bam/.merged.bam}
    
    ## Print file names to the screen
    echo -e '\n'
    echo -e '\tFile1:\t\t' $file1
    echo -e '\tFile2:\t\t' $file2
    echo -e '\tOutput:\t\t' $outfile

    [ -e "$file1" ] && samtools merge $outfile $file1 $file2 || echo "Something went wrong with file " $file1 >> $LOG
    echo $file1 ' : ' $(date) >> $LOG
    
    ## Move original files to BAK folder
    base=${file1##*/}
    mv $file1 $BAK/$base
    
    base=${file2##*/}
    mv $file2 $BAK/$base
done

echo 'Done : ' $(date) >> $LOG