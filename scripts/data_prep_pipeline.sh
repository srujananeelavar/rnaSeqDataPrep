#!/bin/bash

SECONDS=0

cd /Users/srujananeelavar/Documents/Projects/bulkRNASeqSetup/

# Step 1: Check the quality of the transcripts: Run fastqc
fastqc data/demo.fastq -o data/

# Step 2: Trim the adapters from the transcripts
trimmomatic SE -threads 4 data/demo.fastq data/demo_trimmed.fastq TRAILING:10 -phred33
echo "Step 2: Trim the adapters from the transcripts completed."

fastqc data/demo_trimmed.fastq -o data/
echo "Step 1 and Step 2 completed."

# Step 3: Align the transcripts to the reference genome
# Fetch genome indices
# wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz
# tar -xvf grch38_genome.tar.gz

# Run alignment
hisat2 -q --rna-strandness R -x HISAT2/grch38/genome -U data/demo_trimmed.fastq | samtools sort -o HISAT2/demo_trimmed.bam
echo "Step 3: Align the transcripts to the reference genome completed."

# Step 4: Count the number of reads aligned to each gene
# Download annotation file
# wget https://ftp.ensembl.org/pub/release-111/gtf/homo_sapiens/Homo_sapiens.GRCh38.111.gtf.gz
# conda create -n featurecounts -c bioconda subread

featureCounts -S 2 -a data/Homo_sapiens.GRCh38.111.gtf -o quants/demo_featurecounts.txt HISAT2/demo_trimmed.bam
echo "Read counts done!"

duration=$SECONDS
echo "Step 1, Step 2 and Step3 completed in $(($duration / 60)) minutes and $(($duration % 60)) seconds."
