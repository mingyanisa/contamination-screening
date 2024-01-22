import gzip
from Bio import SeqIO
from io import StringIO
seq_lenght=list()
avg_phred_score=list()
with gzip.open("./sars-cov-2/aligned/SRR13937750_1.fastq.gz", "rt") as handle:
    for record in SeqIO.parse(handle, "fastq"):
        print(record.format("qual"))
        # avg_phred_score.append(sum(record.letter_annotations["phred_quality"])/len(record.letter_annotations["phred_quality"]))
        seq_lenght.append(len(record.seq))
print(min(seq_lenght),max(seq_lenght))
