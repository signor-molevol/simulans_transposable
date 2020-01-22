#!/bin/bash
#SBATCH --ntasks=16
#SBATCH --time=10000:00
#SBATCH --mem=96000mb

java -Xmx100g -jar GenomeAnalysisTK-3.7/GenomeAnalysisTK.jar \
	-T HaplotypeCaller \
	-R transposon_sequence_set.embl.fasta \
	-nct 16 \
-I ERR668315/ERR668315.sorted.dupsmarked.bam \
-I ERR668309/ERR668309.sorted.dupsmarked.bam \
-I ERR668314/ERR668314.sorted.dupsmarked.bam \
-I ERR668316/ERR668316.sorted.dupsmarked.bam \
-I ERR668325/ERR668325.sorted.dupsmarked.bam \
-I ERR668308/ERR668308.sorted.dupsmarked.bam \
-I ERR668317/ERR668317.sorted.dupsmarked.bam \
-I ERR668326/ERR668326.sorted.dupsmarked.bam \
-I ERR668312/ERR668312.sorted.dupsmarked.bam \
-I ERR668311/ERR668311.sorted.dupsmarked.bam \
-I ERR668322/ERR668322.sorted.dupsmarked.bam \
-I ERR668313/ERR668313.sorted.dupsmarked.bam \
-I ERR668319/ERR668319.sorted.dupsmarked.bam \
-I ERR668323/ERR668323.sorted.dupsmarked.bam \
-I ERR668306/ERR668306.sorted.dupsmarked.bam \
-I ERR668320/ERR668320.sorted.dupsmarked.bam \
-I ERR668318/ERR668318.sorted.dupsmarked.bam \
-I ERR668310/ERR668310.sorted.dupsmarked.bam \
-I ERR668307/ERR668307.sorted.dupsmarked.bam \
-I ERR668324/ERR668324.sorted.dupsmarked.bam \
-I ERR668305/ERR668305.sorted.dupsmarked.bam \
-I ERR668321/ERR668321.sorted.dupsmarked.bam \
-o transposable_SNPS_africa.vcf;