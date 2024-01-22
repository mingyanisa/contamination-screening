Contamination Screening
===
This repository contains tools and scripts for contamination screening using `fastp` and `bowtie2`.

Usage
--
* Clone the repository to your local machine.
* Install fastp and bowtie2 if you haven't already. Suggested using conda virtual environment. The list of package used can be found in `package-list.txt`.
* Run `./run_contam_screening.sh {species} {sample_filename}` to start the screening process.

Inputs
--
- Interested Reads (FastQ files)
- Reference Genome (Fasta file)
    - sars-cov-2
    - phix174

Process
--
1. Preprocess the input FastQ files using fastp to obtain cleaned reads.
2. Use bowtie2 to align the cleaned reads with the reference genome.
3. Collect the aligned reads.

Outputs
--
* `{species}/trimmed/{run_accession}.fastq.gz` collects cleaned reads from fastp QC and adaptor trimming.
* `{species}/{run_accession}_report.html` & `{species}/{run_accession}_report.json` collects statictics from fastp QC and adaptor trimming.
* `{species}/aligned/{run_accession}.fastq.gz` collects cleaned reads that are aligned with the reference genome by using bowtie2 alignment.
* `{run_accession}_stat.log` collects bowtie2 alignment performance.


Useful links
---
- https://github.com/OpenGene/fastp
- https://bowtie-bio.sourceforge.net/bowtie2/manual.shtml 
