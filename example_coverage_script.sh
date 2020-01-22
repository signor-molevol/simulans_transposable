#!/bin/bash
#SBATCH --ntasks=3
#SBATCH --time=10000:00
#SBATCH --mem=32000mb

#fill in fields called "your_" with the appropriate file names or paths

WORK_COMMON="your_directory";
BWA_DIR="$WORK_COMMON/bin/bwa-0.7.15";
REFBASE="$WORK_COMMON/reference";
REF_PFX="$REFBASE/transposon_sequence_set.embl.fasta";

cd "your_directory" 

OUT="your_file_name"


echo $OUT

OUT_PFX="$(cut -d '_' -f 1 <<< "$OUT" )"

bedtools coverage -counts -b $OUT_PFX.sorted.dupsmarked.bam.q15.bam -a $REF_PFX > $OUT_PFX.counts

done