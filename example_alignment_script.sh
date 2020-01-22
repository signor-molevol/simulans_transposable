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

OUT_PFX="$(cut -d '_' -f 1 <<< "$OUT" )"

READ_GRP=$OUT_PFX;
RG='@RG\tID:'$OUT_PFX'\tPL:ILLUMINA\tSM:'$READ_GRP'\tDS:pfx='$REF_PFX;

mkdir $OUT_PFX;
  

$BWA_DIR/bwa mem -M -R $RG $REF_PFX "$OUT_PFX"_pass_1.fixed.fastq "$OUT_PFX"_pass_2.fixed.fastq > $OUT_PFX/$OUT_PFX.sam;
    
samtools view -b -S $OUT_PFX/$OUT_PFX.sam > $OUT_PFX/$OUT_PFX.bam;
      	  
rm $OUT_PFX/$OUT_PFX.sam

samtools sort $OUT_PFX/$OUT_PFX.bam $OUT_PFX/$OUT_PFX.sorted;

rm $OUT_PFX/$OUT_PFX.bam 

samtools index $OUT_PFX/$OUT_PFX.sorted.bam;

samtools flagstat $OUT_PFX/$OUT_PFX.sorted.bam | tee $OUT_PFX/$OUT_PFX.flagstat.txt;

java -Xmx20g -jar picard.jar MarkDuplicates I=$OUT_PFX/$OUT_PFX.sorted.bam O=$OUT_PFX/$OUT_PFX.sorted.dupsmarked.bam M=$OUT_PFX/$OUT_PFX.picard_metrics.txt;

done