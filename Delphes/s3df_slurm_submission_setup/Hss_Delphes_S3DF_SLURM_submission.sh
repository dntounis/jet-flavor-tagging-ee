#!/bin/bash
#
#SBATCH --account=atlas:default
#SBATCH --partition=roma
#SBATCH --job-name=Hss_Delphes
#SBATCH --output=Hss_Delphes_%A_%a.out
#SBATCH --error=Hss_Delphes_%A_%a.err
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=12g
#SBATCH --time=0-4:00:00
#SBATCH --gpus 0
#SBATCH --array=0-89 # Adjust this based on the number of seeds, e.g. for 60 seeds should be 0-59
#SBATCH --mail-user=dntounis@slac.stanford.edu
#SBATCH --mail-type=ALL # Type of e-mail from slurm; other options are: Error, Info
# Define an array of seeds

jobs_per_flavor=30

# Define an array of directories containing the sindarin files
#flavors=("bb" "cc" "dd" "gg" "ss" "tautau" "uu")
flavors=("bb" "cc" "dd")
#flavors=("gg" "ss" "uu")

PROCESS="nunuH"
# choose one from Z,nunuH and nunuHH

DETECTOR="SiD_2024"
# choose one from SiD_2024,IDEA and FCCeeDetWithSiTracking

# Select the directory based on the array task ID
#FLAVOR=${flavors[$SLURM_ARRAY_TASK_ID]}

# Get the total number of flavors
num_flavors=${#flavors[@]}


# Select the directory based on the array task ID
#FLAVOR=${flavors[$SLURM_ARRAY_TASK_ID]}

# Calculate flavor and number based on the SLURM_ARRAY_TASK_ID
FLAVOR_INDEX=$(($SLURM_ARRAY_TASK_ID / jobs_per_flavor))  # Integer division to get flavor index
NUMBER=$(($SLURM_ARRAY_TASK_ID % jobs_per_flavor))        # Modulo to get number (0-9)

# Get the flavor from the flavors array
FLAVOR=${flavors[$FLAVOR_INDEX]}




#cd /fs/ddn/sdf/group/atlas/d/dntounis
export HOME=/fs/ddn/sdf/group/atlas/d/dntounis

# set up ATLAS environment: instrictuions from here: https://usatlas.readthedocs.io/projects/af-docs/en/latest/sshlogin/ssh2SLAC/

export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase

# Use ALRB_CONT_RUNPAYLOAD to define the actual job payload

#export ALRB_CONT_RUNPAYLOAD="/fs/ddn/sdf/group/atlas/d/dntounis/Hss_setup_test/Delphes/s3df_slurm_submission_setup/myJobPayload.sh $FLAVOR $NUMBER "

export ALRB_CONT_RUNPAYLOAD="__DELPHES_DIR__/s3df_slurm_submission_setup/myJobPayload_production.sh $FLAVOR $NUMBER $PROCESS $DETECTOR "

cd ~

# Run the payload in container.
source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh -c el9 -b –pwd $PWD

# Execute the job
#srun $ALRB_CONT_RUNPAYLOAD
