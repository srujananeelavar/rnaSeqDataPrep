# rnaSeqDataPrep

## Description

This bash script automates the setup for RNA sequencing data analysis. It takes the raw Illumina sequencing data (fastq file) as the input and returns a counts file. 

It performs the following steps:

1. Quality check of the transcripts using FastQC.
2. Trimming of adapters from the transcripts using Trimmomatic.
3. Alignment of the trimmed transcripts to the reference genome using HISAT2.
4. Counting the number of reads aligned to each gene using FeatureCounts.

## Usage

1. Clone this repository or download the script `bulkRNASeqSetup.sh`.
2. Ensure you have the necessary dependencies installed: FastQC, Trimmomatic, HISAT2, samtools, and FeatureCounts.
3. Modify the paths to your data files and reference genome as needed in the script.
4. Make the script executable: `chmod +x bulkRNASeqSetup.sh`.
5. Run the script: `./bulkRNASeqSetup.sh`.

# Install FastQC
conda install -c bioconda fastqc

# Install Trimmomatic
conda install -c bioconda trimmomatic

# Install HISAT2
conda install -c bioconda hisat2

# Install Samtools
conda install -c bioconda samtools

# Install FeatureCounts
conda install -c bioconda subread
