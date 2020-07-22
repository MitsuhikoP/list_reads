# list_reads
list up the number of reads of all files in the directory.

## Dependency
- python3
- R
- ggplot2
- tidyr

If you don't install these R packages, they are automatically installed.

## Usage
```
python3 list_reads.py [-o output_root] [-s float] dir [dir...]
```
Put list_reads.r on the same directory with list_reads.py

`-o output_root` Output file name. output_root.txt and output_root.pdf. Default is MIGreads.

`-s float` file size of output_root.pdf. Default is 7. When you use many samples and see sample name, overlap of sample names are  avoided by large size PDF (but same font size).

Extention of your files in dirs should be `.fastq`, `.fq`, `.fastq.gz`, `.fz.gz`, `.fasta`, `.fa`, `.fasta.gz`, or `.fa.gz`, and list_reads.py automatically discriminated between fasta and fastq.

Red horizontal line indicate 10,000 reads. I think that samples less than this threshold are removed from MIG-seq analysis.

## Change Log
|20200722 |Skip non-fastq/fasta files.|
|20191017 |Don't count Undetermined and PhiX.|
|20190410 |Created.|
