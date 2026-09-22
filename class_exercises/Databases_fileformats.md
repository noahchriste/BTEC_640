# File Formats & Public Databases in Bioinformatics

>[!IMPORTANT]Read the theory sections below for further practice and reference, during class we will not have time to read the entire document.


## Public repositories:

There are three main sites that have been responsible for storing **nucleotide sequence** data from 1982 to the present and are all coordinated by the International Nucleotide Sequence Database Collaboration (INSDC):


1) [GenBank at the National Center for Biotechnology
Information (NCBI) of the National Institutes of Health (NIH)](https://www.ncbi.nlm.nih.gov/)
2) [European Molecular Biology Laboratory (EMBL)-Bank Nucleotide Sequence Database (EMBL-Bank)](https://www.ebi.ac.uk/)
3) [DNA data Bank from Japan DDBJ](https://www.ddbj.nig.ac.jp/index-e.html)


| | **NCBI** | **EMBL** | **DDBJ** |
|---|---|---|---|
| Primary sequence database | GenBank | ENA (European Nucleotide Archive) | DDBJ (same name as the organization) |
| Founded | 1982 (GenBank) | 1980 (EMBL Data Library); ENA name since 2008 | 1986 |
| Metadata File Format* | GenBank format (.gb) | EMBL format (.embl)| similar to GenBank
| Specialized Genome Browser** | Genome Data Viewer |Ensembl |DDBJ Genome Browser|
| Protein database | NCBI protein database | Uniprot | DDJB protein database |
| Curation | reference sequences RefSeq: NCBI-specific | NA | NA | 

\***Metadata file format:**

This an example for the human major histocompatibility complex gene metadata. Notice how the exact same biological details (exons, protein sequence, and the organism) are structuralized using two completely different naming formats.

**GeneBank format** 
```
LOCUS       NM_002116               3515 bp    mRNA    linear   PRI 09-AUG-2026
DEFINITION  Homo sapiens major histocompatibility complex, class I, A (HLA-A),
            transcript variant 1, mRNA.
ACCESSION   NM_002116
VERSION     NM_002116.8
KEYWORDS    RefSeq.
SOURCE      Homo sapiens (human)
  ORGANISM  Homo sapiens
            Eukaryota; Metazoa; Chordata; Mammalia; Primates; Hominidae; Homo.
FEATURES             Location/Qualifiers
     source          1..3515
                     /organism="Homo sapiens"
                     /mol_type="mRNA"
                     /db_xref="taxon:9606"
     gene            1..3515
                     /gene="HLA-A"
                     /gene_synonym="HLAA"
                     /db_xref="GeneID:3105"
     CDS             73..1170
                     /gene="HLA-A"
                     /codon_start=1
                     /product="HLA class I histocompatibility antigen, A-3 alpha chain"
                     /protein_id="NP_002107.4"
                     /translation="MAVMAPRTLLLLLSGALALTQTWAGSHSMRYFFTSVSRPGRGEPR
                     FIAVGYVDDTQFVRFDSDAASQRMEPRAPWIEQEGPEYWDQETRNVKAQSQTDRVDLGT
                     LRGYYNQSEAGSHTIQIMYGCDVGSDGRFLRGYRQDAYDGKDYIALNEDLRSWTAADMA
                     AQITKRKWEAVHAAEQRRVYLEGRCVDGLRRYLENGKETLQRTDPPKTHMTHHPISDHE
                     ATLRCWALGFYPAEITLTWQRDGEDQTQDTELVETRPAGDGTFQKWAAVVVPSGEEQRY
                     TCHVQHEGLPKPLTLRWELSSQPTIPIVGIIAGLVLLGAVITGAVVAAVMWRRKSSDRK
                     GGSYSQAASSDSAQGSDVSLTACKV"
ORIGIN      
        1 gaggccgcgc cgacccggcg gggccgcggg gggccggggc gaccgccggc ggtactgagg
       61 cccccgcatg ctgtgatggc cgtcatggcg ccccgaaccc tcctcctgct actctcgggg
      121 gccctggccc tgacccagac ctgggcgggg tctcactcca tgaagtatta tttcacctcc
//
```

**EMBL format**


```
ID   NM_002116; SV 8; linear; mRNA; STD; PRI; 3515 BP.
XX
DE   Homo sapiens major histocompatibility complex, class I, A (HLA-A),
DE   transcript variant 1, mRNA.
XX
AC   NM_002116;
XX
KW   RefSeq.
XX
OS   Homo sapiens (human)
OC   Eukaryota; Metazoa; Chordata; Mammalia; Primates; Hominidae; Homo.
XX
FH   Key             Location/Qualifiers
FH
FT   source          1..3515
FT                   /organism="Homo sapiens"
FT                   /mol_type="mRNA"
FT                   /db_xref="taxon:9606"
FT   gene            1..3515
FT                   /gene="HLA-A"
FT                   /gene_synonym="HLAA"
FT                   /db_xref="GeneID:3105"
FT   CDS             73..1170
FT                   /gene="HLA-A"
FT                   /codon_start=1
FT                   /product="HLA class I histocompatibility antigen, A-3 alpha chain"
FT                   /protein_id="NP_002107.4"
FT                   /translation="MAVMAPRTLLLLLSGALALTQTWAGSHSMRYFFTSVSRPGRGEPR
FT                   FIAVGYVDDTQFVRFDSDAASQRMEPRAPWIEQEGPEYWDQETRNVKAQSQTDRVDLGT
FT                   LRGYYNQSEAGSHTIQIMYGCDVGSDGRFLRGYRQDAYDGKDYIALNEDLRSWTAADMA
FT                   AQITKRKWEAVHAAEQRRVYLEGRCVDGLRRYLENGKETLQRTDPPKTHMTHHPISDHE
FT                   ATLRCWALGFYPAEITLTWQRDGEDQTQDTELVETRPAGDGTFQKWAAVVVPSGEEQRY
FT                   TCHVQHEGLPKPLTLRWELSSQPTIPIVGIIAGLVLLGAVITGAVVAAVMWRRKSSDRK
FT                   GGSYSQAASSDSAQGSDVSLTACKV"
XX
SQ   Sequence 3515 BP; 712 A; 1045 C; 1083 G; 675 T; 0 Other;
     gaggccgcgc cgacccggcg gggccgcggg gggccggggc gaccgccggc ggtactgagg        60
     cccccgcatg ctgtgatggc cgtcatggcg ccccgaaccc tcctcctgct actctcgggg       120
     gccctggccc tgacccagac ctgggcgggg tctcactcca tgaagtatta tttcacctcc       180
//
```



\*\***Genome broswer:**
These are interactive, graphical user interfaces that allows us to explore the blueprint of an organism's DNA. 
The most popular genome browsers are NCBI, Ensembl and UCSC, the main differences between them are:



| | **NCBI** | **Ensembl** | **UCSC** |
|---|---|---|---|
| Run by | US government (NIH/NLM) | EMBL-EBI + Wellcome Sanger (UK/EU) | UC Santa Cruz |
| Core identity | The main general purpose archive: sequences, literature, bioprojects | Genome annotation + comparative genomics across species | Genome browser + annotation, strong human/model-organism focus |
| Accession labels | `NM_`, `NR_`, `XM_`, `XR_` (RefSeq) | Stable IDs: `ENSG` (gene), `ENST` (transcript), `ENSP` (protein) | Often reuses RefSeq/GenBank IDs |


Genome browsers display many categories of information about chromosomal features, including genes, regulatory regions, variation, introns, exons, mRNA, non-coding DNA, isoforms, etc. 

## The most common file-formats for high-throughput biological data

There are multiple formats to storage, represent and analyze biological data. As you start creating your own scripts, workflows or if you ended up developing your own bioinformatic tools, **understanding the exact structure and specific information contained within each format is crucial.**

These are the most common formats that you will work with. 

| Format | Stores | Human-readable? | Typical use | Example tool/database |
|---|---|---|---|---|
| **GenBank flat file** (`.gb`, `.gbk`) | Sequence + rich embedded annotation in one file | Yes (plain text) | Single-record view combining sequence and feature annotation | NCBI |
| [**FASTA**](https://www.ncbi.nlm.nih.gov/genbank/fastaformat/) (`.fa`, `.fasta`) | Raw sequence only (DNA, RNA, or protein), no quality, no annotation | Yes (plain text) | Reference genomes, gene/protein sequences | NCBI, Ensembl, UCSC |
| [**FASTQ**](https://casrai.org/guides/fastq-format-explained) (`.fastq`, `.fq`) | Raw sequencing reads + per-base quality scores | Yes (plain text) | Direct output of a sequencing machine, pre-analysis | SRA, ENA/DDBJ (DRA) |
| [**GTF**](https://genome.ucsc.edu/FAQ/FAQformat.html#format4) (`.gtf`) | Gene annotation, it contains coordinates, feature type, strand, key-value attributes | Yes (plain text) | Annotate and locate genes in a genome/transcriptome | NCBI RefSeq, Ensembl |
| [**GFF3**](https://genome.ucsc.edu/FAQ/FAQformat.html#format4) (`.gff`, `.gff3`) | Gene annotation, similar to GTF, hierarchical structure | Yes (plain text) | Same purpose as GTF, different syntax/structure | NCBI, Ensembl |
| [**BED**](https://genome.ucsc.edu/FAQ/FAQformat.html#format1) (`.bed`) | Simple genomic intervals: chromosome, start, end (+ optional name/score/strand) | Yes (plain text) | coordinates, regions of interest, custom feature sets | Created by UCSC |
| [**SAM**](https://samtools.github.io/hts-specs/SAMv1.pdf) (`.sam`) | Sequence Alignment Map, reads aligned to a reference genome, with position + alignment quality | Yes (plain text) | Human-readable version of alignment data | Output of aligners (BWA, Bowtie, STAR) |
| [**BAM**](https://genome.ucsc.edu/goldenPath/help/bam.html) (`.bam`) | Same data as SAM but binary compressed | No (binary) | Efficient storage/processing of large alignment datasets | Same as SAM|


## Class excercise:

#### :pencil: **Excercise 1**
>[!CAUTION]
:rotating_light::rotating_light::rotating_light::rotating_light: <BR>
**PLEASE, ALWAYS DOUBLE CHECK THAT YOU ARE WORKING INSIDE** `btec_640/class_excercices directory`. <br>
As we progress we will start using commands that can be "dangerous" if you are not fully concentrated in the excercise, you can accidentally erase or overwrite all your computer files, so please **STAY FOCUS AND BE MINDFUL**. 
>

**Today's organism:** *Escherichia coli* str. K-12 substr. MG1655 this is the classic reference bacterium in molecular biology because it has a small genome (~4.6 Mb), is fully annotated, and available from both NCBI and Ensembl. 


### Step 1: Set up your working directory for today


You already have your btec_640 directory in your own computer. 

- Create today's **working directory**, inside your `/btec_640/class_excercises/` directory, and inside the working directory, create `input_data`. 
Do it using a single command line.

>
> <details>
> <summary><b> 💡Click here for a hint</b></summary>
> mkdir -p 
>
></details>

<br>

```bash
#Paste your command here:




```


  - Create your README file with a description for the content (*e.g. This directory corresponds to E. coli class excercise and the content is...*)



> <details>
> <summary><b> 💡Click here for a hint</b></summary>
><br>
>
> ```bash
> touch filename.txt
> nano filename.txt 
> ```
> </details>

<br>
   

The structure should look like this:

:open_file_folder:btec_640
- :open_file_folder: class_excercises:
  - :open_file_folder: new_working_dir (name it following best practices)
    - :page_facing_up: README
    - :open_file_folder: input_data
    




### Step 2: Download your input data

Move inside your `input_data` directoy. 

:question: Which comand did you use to make sure that you are inside `input_data`? <br>

**Answer**:
```bash
#Paste your command here:




#Paste your terminal output below:




```
 

Download *E. coli*  data from NCBI using curl. 

```bash
curl -o ecoli_genomic.fna.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz"
curl -o ecoli_protein.faa.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_protein.faa.gz"
curl -o ecoli.gtf.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gtf.gz"
curl -o ecoli.gff.gz "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.gff.gz"

```

Unzip the documents, **but let's do it using a loop**, no need to unzip one by one. 

Let's do this step by step:

  - Identify on which objects you want to execute an action or a command, in this case `gunzip`
  - Find a common pattern in all the files that you just download (:bulb: You have two possible options). 
  - Build your order following the loop syntax.


    >[!TIP] 
    >**Syntax: `for each` (loop over a file)**
    >
    >```bash
    >for FILE in  "pattern"
    >do 
    >   COMMAND $FILE  
    >done
    >```
    >Note that this syntax is different from our chromosome 21 excercise, where you used `while read`.

<br>:question: Take a moment to compare both syntaxes. Why are we not specifying the `>INPUT_FILE` here?
```bash
#Type your answer below:




```

Following the **for each** syntax you can use either of these format options:


```bash
for f in ecoli*; do gunzip $f ; done
```

or

```bash
for f in *gz
do 
    gunzip $f
done
```

>[!CAUTION] 
> :stop_sign: :stop_sign: Look how we are using `*`. 
> <br>
> Think  of the asterisk `*` as a "wildcard" that means **"anything"**
><br>
> **This can be super helpful but also extremely dangerous.** 


### Step 3: Understanding the files

#### FASTA:

The FASTA format is a text-based format that contains either nucleotide or amino acid (protein) sequences. It can be a single sequence (like the ones you got from the Chromosome 21 excercise), or a multi-fasta file with more than one sequence. 

Each sequence has a unique ID that we will call *header* and it is represented with `>` followed by the gene/protein ID name. 

Everytime a `>` symbol appears in a FASTA file, bioinformatic tools will read it as the start of a new seuqnce.


#### :pencil: **Excercise 2**

Print the first **5 lines** of both fasta files, `ecoli_genomic.fna` and `ecoli_protein.faa` and compare both files.

> <details><summary><b> 💡Click here for a hint</b></summary>
>
> ```bash
> head -n 10 #will print the first 10 lines
>```
></details> <br>

<br>

:question:Write the main differences that you see between both files. Describe what type of information each file has.
```
Type your answer here:




```

:question:
In a FASTA file, `>` marks the beginning of a header line (or ID/description line) that introduces a new and independent sequence. Using `grep`, count how many sequences each files have:

> <details><summary><b> 💡Click here for a hint</b></summary>
>
> ```bash
> grep -c 
>```
></details>
 <br>

```
Type your answer:




```

>[!CAUTION] 
In coding, `>` normally means redirect output into a file, it is like  "s*ave and create a file*".
Inside quotes, `">"` is just a literal character for `grep` to search for, not a redirection.<br> 
:warning: **If you forget the quotes bash will interpret your command differently and it will create or overwrite a file instead of searching for anything.** 
Always quote special characters like `>`, `*`, `$` when you mean them literally.

:question: If both fasta files are from the same species, why the number of sequences is different?

```
Type your answer:




```



Using `grep`, print only the headers and save them in a new file name `ecoli_genome_headers.txt` and `ecoli_proteins_headers.txt` respectively 
(**Notice that you don't need the `-c` flag anymore**)

```bash
Paste your commands here





```



### GFF and GTF

Two common file formats used in genomic data representation are Gene Transfer Format (GTF) and General Feature Format (GFF). Both are a text file, that can be read as a table. 

#### :pencil: **Excercise 3**

Let's analyze and compare the annotation for **b3494** gene in *E. coli*. Both, GFF and GTF files have information abouth this gene. 

With `grep` print and save in a new file the annotation for **b3494** gene for each file. You should generate two files, named them as `b3494.gff` and `b3494.gtf` respectively, and answer the following:




```
1. Paste the commands that you used to print and generate the files:




2. Which are the b3494 gene coordinates in our E. coli genome? locate this information in both files and write down your findings:

b3494.gff file:


b3494.gtf file:



3. How many exons does this gene have? And describe where did you find this information.

b3494.gff file:





b3494.gtf file:






4. What is the Uniprot ID for this protein?


b3494.gff file:


b3494.gtf file:



5. Go to the Uniprot website (https://www.uniprot.org/) using the Uniprot ID that you found,  look for the name and function of this protein:





```



#### FASTQ

For this section we will use a data from [The Carpentries Genomics project](https://datascience.si.edu/carpentries) which has workshops and files to practice bioinformatics.

Download the fastq data from *E. coli* inside your `input_data` directory

```bash
curl -L -o shell_data.tar.gz "https://ndownloader.figshare.com/files/14417834"
```

:bulb: Notice that this file has a new extension type: `tar.gz`. This is a combination of a **TAR** and **GZIP**.

**TAR**: Combines multiple files and directories into one single file (a "tarball") while keeping file permissions and folder structures intact, but it does not reduce the size. <br>
**GZ**: Compresses the combined tar file to reduce its total size. GZ cannot compress an entire folder by itself, this is why TAR package the directories and files into a single file. 

 >[!TIP] 
 **Syntax: `tar` -[flags] <file.tar.gz>**
    ><br>
    >Flags: <br>
    > -**c**: Creates a new archive <br>
    > -**x**: Extract files from an archive <br>
    > -**v**: Displays the archiving process <br>
    > -**z**: Applies gzip compression<br>
    > -**f**: Specifies the name of the archive file<br>


Extract the files with `tar`

```bash
tar -xzvf <filename>
```

Take a look of the structure of the new directory that you have on your terminal. Go inside `shell_data` and do `ls` to see what is inside.


Go to this directory: `shell_data/untrimmed_fastq/`

:question: Open `SRR097977.fastq` file with `less` and explain what's similar and what's different between the fasta files you opened before?

```
Type your answer






```

Based on [this information](https://casrai.org/guides/fastq-format-explained), print the first 4 lines of `SRR097977.fastq`, describee what each line represents:


```
Type you answer here:
(Copy the beginning of each line an explain what information provides)








```

## To get credit: 

Upload your answers in PDF format to canvas under E_coli_excercise