#!/bin/bash
sbatch <<EOT
#!/bin/bash
#SBATCH --job-name=pseudobulk_${1}
#SBATCH --output=pseudobulk_${1}.out
#SBATCH --error=pseudobulk_${1}.err
#SBATCH --time=12:00:00
#SBATCH --partition=gilad
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=24000

module load R/3.6.1
R CMD BATCH --no-save --no-restore '--args assign="$1"' pseudobulk.R pseudobulk_$1.out

EOT


