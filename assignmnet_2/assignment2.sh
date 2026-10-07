#!/bin/bash

#assignment2.sh 

#Author: Noah Christe 

#V1 October 7, 2026

#Description: 
# These are the steps completed during assignment 2

# Usage: This script will run tblastn on the specified genes for each species 


#Required input file 


#EDIT -----------
# Exercise 1: 
# Exercise 2: 
# Exercise 3: 
# Exercise 4: 
# Exercise 5: 
# Exercise 6: 
# Exercise 7: 
# Exercise 8: 
# Exercise 9: 
# Exercise 10: 


##### 1. Create Directories 

#Start in btec_640 

##### DIRECTORIES
WORKDIR=assignment_2
INPUTDIR=input_data
OUTPUTDIR=output_data
ANALYSISDIR=analysis 

##### VARIABLES 
SPECIES=mouse chicken frog zebrafish
GENES=tp53 aim2 tlr9 tlr21 gulo



#Exercise 1: Set Up Directories

mkdir -p $WORKDIR

mkdir -p $WORKDIR/$INPUTDIR
mkdir -p $WORKDIR/$OUTPUTDIR
mkdir -p $WORKDIR/$ANALYSISDIR 


mkdir -p $WORKDIR/$ANALYSISDIR/{gene,survey,proteins,blast}



# Exercise 2: Download the four annotation files 



##Download Annotation Files
#Download the gtf files
curl -o $WORKDIR/$INPUTDIR/mouse.gtf.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.gtf.gz"

curl -o $WORKDIR/$INPUTDIR/chicken.gtf.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/016/699/485/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic.gtf.gz"

curl -o $WORKDIR/$INPUTDIR/frog.gtf.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/004/195/GCF_000004195.4_UCB_Xtro_10.0/GCF_000004195.4_UCB_Xtro_10.0_genomic.gtf.gz"

curl -o $WORKDIR/$INPUTDIR/zebrafish.gtf.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/049/306/965/GCF_049306965.1_GRCz12tu/GCF_049306965.1_GRCz12tu_genomic.gtf.gz"

#Download the fna files 
curl -o $WORKDIR/$INPUTDIR/mouse.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.fna.gz"

curl -o $WORKDIR/$INPUTDIR/chicken.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/016/699/485/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic.fna.gz"

curl -o $WORKDIR/$INPUTDIR/frog.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/004/195/GCF_000004195.4_UCB_Xtro_10.0/GCF_000004195.4_UCB_Xtro_10.0_genomic.fna.gz"

curl -o $WORKDIR/$INPUTDIR/zebrafish.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/049/306/965/GCF_049306965.1_GRCz12tu/GCF_049306965.1_GRCz12tu_genomic.fna.gz"
##Unzip Files

for GENOME in $WORKDIR/$INPUTDIR/*.gz; 
    do gunzip $GENOME; 
    done 

#Exercise 3: Explore the files 

##Create a soft link for each gtf file 

#Soft links for gtf files
ln -s $WORKDIR/$INPUTDIR/chicken.gtf $WORKDIR/$ANALYSISDIR/gene_survey/
ln -s $WORKDIR/$INPUTDIR/frog.gtf $WORKDIR/$ANALYSISDIR/gene_survey/
ln -s $WORKDIR/$INPUTDIR/mouse.gtf $WORKDIR/$ANALYSISDIR/gene_survey/
ln -s $WORKDIR/$INPUTDIR/zebrafish.gtf $WORKDIR/$ANALYSISDIR/gene_survey/

#Soft links for fna files
ln -s $WORKDIR/$INPUTDIR/chicken.fna $WORKDIR/$ANALYSISDIR/gene_survey/
ln -s $WORKDIR/$INPUTDIR/frog.fna $WORKDIR/$ANALYSISDIR/gene_survey/
ln -s $WORKDIR/$INPUTDIR/mouse.fna $WORKDIR/$ANALYSISDIR/gene_survey/
ln -s $WORKDIR/$INPUTDIR/zebrafish.fna $WORKDIR/$ANALYSISDIR/gene_survey/


# Exercise 4: How many genes does each species have?

##use awk to organize data so only lines with "gene" are included
##use wc -l to count the number of lines
#awk -F'\t' '$3=="gene"' $WORKDIR/$INPUTDIR/chicken.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/chicken_gene
#wc -l $WORKDIR/$ANALYSISDIR/gene_survey/chicken_gene
#awk -F'\t' '$3=="gene"' $WORKDIR/$INPUTDIR/frog.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/frog_gene
#wc -l $WORKDIR/$ANALYSISDIR/gene_survey/frog_gene
#awk -F'\t' '$3=="gene"' $WORKDIR/$INPUTDIR/mouse.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/mouse_gene
#wc -l $WORKDIR/$ANALYSISDIR/gene_survey/mouse_gene
#awk -F'\t' '$3=="gene"' $WORKDIR/$INPUTDIR/zebrafish.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/zebrafish_gene
#wc -l $WORKDIR/$ANALYSISDIR/gene_survey/zebrafish_gene

# Exercise 5: Dissect One Gene by Hand 

##gather information about the TLR9 gene in the mouse genome
#grep -i 'gene_id "tlr9";' $WORKDIR/$INPUTDIR/mouse.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/tlr9_mouse.gtf
#less $WORKDIR/$ANALYSISDIR/gene_survey/tlr9_mouse.gtf
##narrow down to just the exon lines
#awk -F'\t' '$3=="exon"' $WORKDIR/$ANALYSISDIR/gene_survey/tlr9_mouse.gtf


#Exercise 6: Repeat for all five genes 
##Mouse 
#grep -i 'gene_id "tp53";' $WORKDIR/$INPUTDIR/mouse.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/tp53_mouse.gtf
#grep -i 'gene_id "aim2";' $WORKDIR/$INPUTDIR/mouse.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/aim2_mouse.gtf
#grep -i 'gene_id "tlr9";' $WORKDIR/$INPUTDIR/mouse.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/tlr9_mouse.gtf
#grep -i 'gene_id "tlr21";' $WORKDIR/$INPUTDIR/mouse.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/tlr21_mouse.gtf
#grep -i 'gene_id "gulo";' $WORKDIR/$INPUTDIR/mouse.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/gulo_mouse.gtf
##Chicken 
#grep -i 'gene_id "tp53";' $WORKDIR/$INPUTDIR/chicken.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/tp53_chicken.gtf
#grep -i 'gene_id "aim2";' $WORKDIR/$INPUTDIR/chicken.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/aim2_chicken.gtf
#grep -i 'gene_id "tlr9";' $WORKDIR/$INPUTDIR/chicken.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/tlr9_chicken.gtf
#grep -i 'gene_id "tlr21";' $WORKDIR/$INPUTDIR/chicken.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/tlr21_chicken.gtf
#grep -i 'gene_id "gulo";' $WORKDIR/$INPUTDIR/chicken.gtf > $WORKDIR/$ANALYSISDIR/gene_survey/gulo_chicken.gtf

#Exercise 7: Survey everything with a loop

##Create a for loop to read each gene in each species 
for SPECIES in mouse chicken frog zebrafish
do
    for GENE in tp53 aim2 tlr9 tlr21 gulo
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
done > gene_survey.txt

#Exercise 8: Download the protein sequence 

#for SPECIES in mouse chicken frog zebrafish
#do
   # for GENE in tp53 aim2 tlr9 tlr21 gulo
    #do

       # grep -o 'protein_id "NP_[^"]*"' ${GENE}_${SPECIES}.gtf | sort -u
    
    #done 

#done > protein_list.txt

grep -o $WORKDIR/$ANALYSISDIR/gene_survey/'protein_id "NP_[^"]*"' aim2_mouse.gtf | sort -u
grep -o $WORKDIR/$ANALYSISDIR/gene_survey/'protein_id "NP_[^"]*"' tlr9_mouse.gtf | sort -u
grep -o $WORKDIR/$ANALYSISDIR/gene_survey/'protein_id "NP_[^"]*"' gulo_mouse.gtf | sort -u
grep -o $WORKDIR/$ANALYSISDIR/gene_survey/'protein_id "NP_[^"]*"' tp53_chicken.gtf | sort -u
grep -o $WORKDIR/$ANALYSISDIR/gene_survey/'protein_id "NP_[^"]*"' tlr21_chicken.gtf | sort -u
grep -o $WORKDIR/$ANALYSISDIR/gene_survey/'protein_id "NP_[^"]*"' tp53_frog.gtf | sort -u
grep -o $WORKDIR/$ANALYSISDIR/gene_survey/'protein_id "XP_[^"]*"' tlr9_frog.gtf | sort -u
grep -o $WORKDIR/$ANALYSISDIR/gene_survey/'protein_id "xP_[^"]*"' tlr21_frog.gtf | sort -u
grep -o $WORKDIR/$ANALYSISDIR/gene_survey/'protein_id "NP_[^"]*"' tp53_zebrafish.gtf | sort -u
grep -o $WORKDIR/$ANALYSISDIR/gene_survey/'protein_id "NP_[^"]*"' tlr9_zebrafish.gtf | sort -u
grep -o $WORKDIR/$ANALYSISDIR/gene_survey/'protein_id "NP_[^"]*"' tlr21_zebrafish.gtf | sort -u

touch $WORKDIR/$ANALYSISDIR/gene_survey/protein_list.txt
nano $WORKDIR/$ANALYSISDIR/gene_survey/protein_list.txt

#Download protein sequences
while read -r gene species accession
do
    curl -o $WORKDIR/$ANALYSISDIR/proteins/${gene}_${species}.faa "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=protein&id=${accession}&rettype=fasta&retmode=text"
    sleep 1
done < $WORKDIR/$ANALYSISDIR/gene_survey/protein_list.txt

#sum up the protein sequences for each gene 
cat $WORKDIR/$ANALYSISDIR/proteins/tlr9_*.faa > $WORKDIR/$ANALYSISDIR/proteins/tlr9_all.faa
cat $WORKDIR/$ANALYSISDIR/proteins/tlr21_*.faa > $WORKDIR/$ANALYSISDIR/proteins/tlr21_all.faa
cat $WORKDIR/$ANALYSISDIR/proteins/tp53_*.faa > $WORKDIR/$ANALYSISDIR/proteins/tp53_all.faa
cat $WORKDIR/$ANALYSISDIR/proteins/aim2_*.faa > $WORKDIR/$ANALYSISDIR/proteins/aim2_all.faa
cat $WORKDIR/$ANALYSISDIR/proteins/gulo_*.faa > $WORKDIR/$ANALYSISDIR/proteins/gulo_all.faa

#Blast database creation for each genome
for GENOME in *.fna
do
    makeblastdb -in $GENOME -dbtype nucl -out ${GENOME%.fna}
done

#run tblast for NOT_FOUND genes
for SPECIES in mouse chicken frog zebrafish
do
    for GENE in tlr9 tlr21 tp53 aim2 gulo
    do
        if [ -f $WORKDIR/$ANALYSISDIR/gene_survey/${GENE}_${SPECIES}.gtf ]
        then
        tblastn -query PROTEIN.faa \
            -db DATABASE_NAME \
            -evalue 1e-5 \
            -max_target_seqs 5 \
            -outfmt "6 qseqid sseqid pident length qstart qend sstart send evalue bitscore qcovs" \
            -out RESULTS.tsv
        fi
    done
done