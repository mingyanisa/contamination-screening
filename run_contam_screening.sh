#!/usr/bin/env bash
species=${1:-"sars-cov-2"}
filename=${2:-"SRR21435444_1.fastq.gz"}
sample=$(basename -- "${filename%_*}")
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ "$species" == "sars-cov-2" ]]; then
	ref_file=${DIR}/${species}/ref/NC_045512.2
elif [[ "$species" == "phix174" ]]; then
	ref_file=${DIR}/${species}/ref/NC_001422.1
else
	{ echo "No species specified!/Species not available"; exit $ERRCODE; }
fi	
mkdir -p ${DIR}/${species}/trimmed ${DIR}/${species}/sam ${DIR}/${species}/aligned
echo $ref_file
fastp --in1 ${DIR}/${species}/reads/${sample}_1.fastq.gz --in2 ${DIR}/${species}/reads/${sample}_2.fastq.gz --out1 ${DIR}/${species}/trimmed/${sample}_1.fastq.gz --out2 ${DIR}/${species}/trimmed/${sample}_2.fastq.gz -h ${DIR}/${species}/${sample}_report.html -j ${DIR}/${species}/${sample}_report.json
(bowtie2 -x ${ref_file} -1 ${DIR}/${species}/trimmed/${sample}_1.fastq.gz -2 ${DIR}/${species}/trimmed/${sample}_2.fastq.gz -S ${DIR}/${species}/sam/${sample}.sam --al-conc-gz ${DIR}/${species}/aligned/${sample}_%.fastq.gz) 2>${DIR}/${sample}_stat.log 

