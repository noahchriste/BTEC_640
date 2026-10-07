#!/bin/bash

#blast_search.sh 

#Author: Noah Christe 

#V1 September 23, 2023

#Description: 
# This is the steps for running a blastn search of my query against the NCBI database


# Usage: 


#Required inpute file 


#EDIT -----------
# Working dir variables
# 1. Create directories
# 2. Read the data in Fasta format (nucleotides, amino acids)
# 3. Call Blast
# 4. Search 
# 5. Save in an output file
# 6. Check the data 


##### 1. Create Directories 

##### VARIABLES for directory 

WORKDIR="project_blast"
INPUTDIR=input_data
OUTPUTDIR=output_data
ANALYSISDIR=analysis 

##### VARIABLES for input data 
#input should be a FASTA file 
INPUT=LSS.fasta
#INPUT_REFERENCE=$WORKDIR/$INPUTDIR/chr21.fa
# for file *.fasta; 
### do sh run_blast.sh $file; 
##### done > $WORKDIR/$OUTPUTDIR/blast_out.txt 

mkdir -p $INPUTDIR
mkdir -p $OUTPUTDIR
mkdir -p $ANALYSISDIR

#blastn –db nt –query nt.fsa –out results.out
### This code is going to run blastn (Nucleotide) 

cd $INPUTDIR

# 2. Download the chr21 data
curl -o hg38.ncbiRefSeq.gtf.gz "https://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/genes/hg38.ncbiRefSeq.gtf.gz"
 #download the chr21 data from the NCBI database
 
 # 3. Unzip the data
gunzip hg38.ncbiRefSeq.gtf.gz # Unzip the data into a gtf file


# 4. Link the data to the analysis directory
#ln -s ../hg38.ncbiRefSeq.gtf #link a working copy of the data to the analysis directory

#5, Filter the data to meaningful catergories: chr21 and protein coding genes
grep "chr21" hg38.ncbiRefSeq.gtf > chr21.gtf # Filter the data to only include chromosome 21 data 

grep "NM_" chr21.gtf > refseq_chr21.gtf #Filter data for only protein coding genes

# 6. Remove unneeded information
awk -F '\t' '{print $9}' refseq_chr21.gtf  | 
    awk -F'"' '!seen[$2]++ {print $2, $4}' refseq_chr21.gtf > gene_accession.txt #select for gene name and accession number, remove duplicates, and print to a new file

wc -l gene_accession.txt #check the data is selected properly 

# 7. Download the new filtered sequence data
head -n 10 gene_accession.txt > 10_genes.txt
cat 10_genes.txt #use only the first 10 genes 

while read -r gene accession
do
    curl -o "${gene}.fasta" "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=${accession}&rettype=fasta&retmode=text"

done < 10_genes.txt # Download the sequence data for the first 10 genes in fasta format using the accession numbers from the gene_accession.txt file


# Input human chromosome 21 fasta file 
curl -o chr21.fa.gz "https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/chr21.fa.gz"

gunzip chr21.fa.gz

# makeblastb 
makeblastdb -in chr21.fa -dbtype nucl -out chr21_nucl

while read -r GENE ID
do
    blastn -db $WORKDIR/$INPUTDIR/chr21_nucl -query $WORKDIR/$INPUTDIR/${GENE}.fasta -out $WORKDIR/$OUTPUTDIR/${GENE}_blast_out.tsv -outfmt 6 

done < 10_genes.txt

# blastn -db chr21_nucl -query $INPUT -out ../$OUTPUTDIR/blast_out.txt


### Check your data 


less ../$OUTPUTDIR/blast_out.txt 

#making a loop 
