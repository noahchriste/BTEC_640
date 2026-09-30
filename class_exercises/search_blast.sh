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

WORKDIR="/Users/nchriste/Documents/btec_640/"
INPUTDIR="input_data"
OUTPUTDIR="output_data"
ANALYSISDIR="analysis" 

##### VARIABLES for input data 
#input should be a FASTA file 
INPUT=
# for file *.fasta; 
### do sh run_blast.sh $file; 
##### done > $WORKDIR/$OUTPUTDIR/blast_out.txt 

mkdir -p $WORKDIR
mkdir -p $WORKDIR/$INPUTDIR
mkdir -p $WORKDIR/$OUTPUTDIR
mkdir -p $WORKDIR/$ANALYSISDIR

#blastn –db nt –query nt.fsa –out results.out
### This code is going to run blastn (Nucleotide)

blastn -db nt -query $WORKDIR/$INPUTDIR/$INPUT -out $WORKDIR/$OUTPUTDIR/blast_out.txt


### Check your data 


less $WORKDIR/$OUTPUTDIR/blast_out.txt 