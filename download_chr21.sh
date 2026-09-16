
# download_chr21.sh

# Author: Noah Christe
#Version: 14 September 2026 

# Description: 

#   This Document describes the steps to download chromosome 21 data from the NCBI database.
#   1. Move and make working directories
#   2. Download the chr21 data
#   3. Unzip the data
#   4. Link the data to the analysis directory
#   5. Filter the data to meaningful catergories: chr21 and protein coding genes 
#   6. Remove unneeded information 
#   7. Download the new filtered sequence data. 


# 1. Move and make working directories
cd btec_640/class_exercises/ # Move directory
mkdir -p sept_14_exercise # Make working directory
mkdir -p sept_14_exercise/input_data # Make working directory for raw input data
mkdir -p sept_14_exercise/analysis  # Make working directory for analysis and manipulation of the data
cd sept_14_exercise/input_data # Move into the input data directory 

# 2. Download the chr21 data
curl -o hg38.ncbiRefSeq.gtf.gz "https://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/genes/hg38.ncbiRefSeq.gtf.gz"
 #download the chr21 data from the NCBI database
 
 # 3. Unzip the data
gunzip hg38.ncbiRefSeq.gtf.gz # Unzip the data into a gtf file

# 4. Link the data to the analysis directory
ln -s ../input_data/hg38.ncbiRefSeq.gtf #link a working copy of the data to the analysis directory

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




