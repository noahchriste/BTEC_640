#!/bin/bash

#gene_survey_pipeline.sh

#Author: Noah Christe 

#V1 October 7, 2026

#Description: 
# These are the steps completed during assignment 2

# Usage: This script will run tblastn on the specified genes for each species 


#Required input file 


#EDIT -----------
# Step 1: Make Directories
# Step 2: Download and Annotate Files 
# Step 3: Soft Link the Files
# Step 4: Survey the Files for GENE and SPECIES 
# Step 5: Check for Protein IDs
# Step 6: Download Protein Sequences
# Step 7: Create BLAST Database
# Step 8: Run tblastn 
 


##### 1. Create Directories 

#Start in btec_640 

##### DIRECTORIES
WORKDIR=assignment_2
INPUTDIR=input_data
OUTPUTDIR=output_data
ANALYSISDIR=analysis 

##### VARIABLES 
SPECIES=("mouse" "chicken" "frog" "zebrafish")
GENES=("tp53" "aim2" "tlr9" "tlr21" "gulo")



# Step 1: Set Up Directories
## mkdir -p to create new directories with the defined names as specified above 
## This allows all locations to accurate as the code is ran and does not require constant moving in and out of the directories

mkdir -p $WORKDIR

mkdir -p $WORKDIR/$INPUTDIR
mkdir -p $WORKDIR/$OUTPUTDIR
mkdir -p $WORKDIR/$ANALYSISDIR 


mkdir -p $WORKDIR/$ANALYSISDIR/{gene_survey,proteins,blast}



# Step 2: Download the four annotation files and genomes

## Download Annotation Files
## Download the gtf files
## This is downloading the annotated information of each species
curl -o $WORKDIR/$INPUTDIR/mouse.gtf.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.gtf.gz"

curl -o $WORKDIR/$INPUTDIR/chicken.gtf.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/016/699/485/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic.gtf.gz"

curl -o $WORKDIR/$INPUTDIR/frog.gtf.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/004/195/GCF_000004195.4_UCB_Xtro_10.0/GCF_000004195.4_UCB_Xtro_10.0_genomic.gtf.gz"

curl -o $WORKDIR/$INPUTDIR/zebrafish.gtf.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/049/306/965/GCF_049306965.1_GRCz12tu/GCF_049306965.1_GRCz12tu_genomic.gtf.gz"

## Download the fna files 
### This is downloading the raw genomic sequences of each species
curl -o $WORKDIR/$INPUTDIR/mouse.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.fna.gz"

curl -o $WORKDIR/$INPUTDIR/chicken.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/016/699/485/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic.fna.gz"

curl -o $WORKDIR/$INPUTDIR/frog.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/004/195/GCF_000004195.4_UCB_Xtro_10.0/GCF_000004195.4_UCB_Xtro_10.0_genomic.fna.gz"

curl -o $WORKDIR/$INPUTDIR/zebrafish.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/049/306/965/GCF_049306965.1_GRCz12tu/GCF_049306965.1_GRCz12tu_genomic.fna.gz"

## Unzip Files
## The files are too big to downloaded as raw data so they are compressed and gunzip unwraps the compressed data. 

for GENOME in $WORKDIR/$INPUTDIR/*.gz; 
    do gunzip $GENOME; 
   done 


# Step 3: Create Soft Links

## Create a soft link for each gtf file
## This creates a copy of the files in the analysis directory so the raw data can be maniuplated in analysis but stay untouched in the input directory

## Soft links for gtf files

for SPECIES in "${SPECIES[@]}"
do
    ln -s $WORKDIR/$INPUTDIR/${SPECIES}.gtf $WORKDIR/$ANALYSISDIR/gene_survey/${SPECIES}.gtf
done

## Soft links for fna files
for SPECIES in "${SPECIES[@]}"
do
    ln -s $WORKDIR/$INPUTDIR/${SPECIES}.fna $WORKDIR/$ANALYSISDIR/gene_survey/${SPECIES}.fna
done



# Step 4: Survey everything with a loop

## Create a for loop to read each gene in each species 
## This reads each gene in each species to see if it exists or not and then complies them into a txt file to read 
for SPECIES in "${SPECIES[@]}"
do
   for GENE in "${GENES[@]}"
    do
        grep -i "gene_id \"${GENE}\";" $WORKDIR/$INPUTDIR/${SPECIES}.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/${GENE}_${SPECIES}.gtf
        if [ -s $WORKDIR/$ANALYSISDIR/gene_survey/${GENE}_${SPECIES}.gtf ]
        then
            echo "${GENE} ${SPECIES} FOUND"
        else
            echo "${GENE} ${SPECIES} NOT_FOUND"
            rm $WORKDIR/$ANALYSISDIR/gene_survey/${GENE}_${SPECIES}.gtf
        fi
    done
done > $WORKDIR/$ANALYSISDIR/gene_survey/gene_survey.txt

# Step 5: Check for protein IDs
## This checks to see if any protein IDs are associated with each gene

## Check for NP_ protein IDs

for SPECIES in "${SPECIES[@]}"
do
    for GENE in "${GENES[@]}"
    do
        if [ -s $WORKDIR/$ANALYSISDIR/gene_survey/${GENE}_${SPECIES}.gtf ]
        then
            PROTEIN=$(grep -o 'protein_id "NP_[^"]*"' $WORKDIR/$ANALYSISDIR/gene_survey/${GENE}_${SPECIES}.gtf | head -n 1 | awk -F'"' '{print $2}')
            echo "${GENE} ${SPECIES} ${PROTEIN}"
        fi
    done
done > $WORKDIR/$ANALYSISDIR/gene_survey/protein_list.txt

## Check for XP_ protein IDs
for SPECIES in "${SPECIES[@]}"
do
   for GENE in "${GENES[@]}"
   do
        if [ -s $WORKDIR/$ANALYSISDIR/gene_survey/${GENE}_${SPECIES}.gtf ]
        then
            PROTEIN=$(grep -o 'protein_id "XP_[^"]*"' $WORKDIR/$ANALYSISDIR/gene_survey/${GENE}_${SPECIES}.gtf | head -n 1 | awk -F'"' '{print $2}')
            echo "${GENE} ${SPECIES} ${PROTEIN}"
        fi
   done
done >> $WORKDIR/$ANALYSISDIR/gene_survey/protein_list.txt

# Step 6: Download protein sequences
## This downloads the protein sequences for each gene that was found in the previous step 

## Download protein sequences
while read -r gene species accession
do
    curl -o $WORKDIR/$ANALYSISDIR/proteins/${gene}_${species}.faa "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=protein&id=${accession}&rettype=fasta&retmode=text"
    sleep 1
done < $WORKDIR/$ANALYSISDIR/gene_survey/protein_list.txt

## Sum up the protein sequences for each gene 

for GENE in "${GENES[@]}"
do
   cat $WORKDIR/$ANALYSISDIR/proteins/${GENE}_*.faa > $WORKDIR/$ANALYSISDIR/proteins/${GENE}_all.faa
done

# Step 7: Create BLAST database
## Blast database creation for each genome
## This creates a reference sequence database for each genome
for GENOME in $WORKDIR/$INPUTDIR/*.fna
do
    makeblastdb -in $GENOME -dbtype nucl -out $WORKDIR/$ANALYSISDIR/blast/${GENOME%.fna}
done

# Step 8: Run tblastn for NOT_FOUND genes
## Run tblast for NOT_FOUND genes
## This compares the protein sequences to the genomic sequences to see if there is a match 
for SPECIES in "${SPECIES[@]}"
do
   for GENE in "${GENES[@]}"
    do
        if [ -f $WORKDIR/$ANALYSISDIR/gene_survey/${GENE}_${SPECIES}.gtf ]
        then
            tblastn -query $WORKDIR/$ANALYSISDIR/proteins/${GENE}_${SPECIES}.faa \
                -db $WORKDIR/$ANALYSISDIR/blast/*.fna\
                -evalue 1e-5 \
                -max_target_seqs 5 \
                -outfmt "6 qseqid sseqid pident length qstart qend sstart send evalue bitscore qcovs" \
                -out $WORKDIR/$ANALYSISDIR/blast/${GENE}_${SPECIES}.tsv
        fi
    done
done