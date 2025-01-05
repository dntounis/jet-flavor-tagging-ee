# Jet Flavor Tagging studies for future e+e- colliders

Repository for jet flavor tagging studies for future electron-positron colliders using Delphes fast simulation

To download this repository and all linked submodules:

```
git clone https://github.com/dntounis/jet-flavor-tagging-ee.git .
git submodule update --init --recursive

```



<img width="910" alt="image" src="https://github.com/user-attachments/assets/841c5d37-1118-4aec-899c-07e616c568e2">


## Analysis steps

1. Generation of hard-scatter (HS) Physics processes - done in [whizard](https://whizard.hepforge.org/)
2. Simulation of the interaction of particles from HS events with a detector - using [Delphes](https://github.com/delphes/delphes) fast simulation
3. Clustering of Particle-Flow objects (PFOs) into jets and flat tree creation using [FCCAnalyses](https://github.com/HEP-FCC/FCCAnalyses)
4. Training of NN tagger with [weaver](https://github.com/hqucms/weaver-core)
5. Running inference in [FCCAnalyses](https://github.com/HEP-FCC/FCCAnalyses)


Disclaimer: the workflow above utilizes the [SLAC S3DF](https://s3df.slac.stanford.edu) cluster for job submission via slurm. Any submission scripts have to be modified accordingly if you are using a different job submission system. 

Typical job execution tim S3DF for each step:

|              Step                  | Time [min] |
| -------------------------------    |  --------- |
| Whizard                            | 5       	  |
| Delphes                            | 30     	  |
| FCCAnalysis Stage 1                | 5        	|
| FCCAnalysis Stage 2                | -         	|
| Weaver training                    | -         	|
| FCCAnalysis Inference              |           	|



## Whizard

To run Whizard sample generation, first cd to the whizard directory. Then set the paths accordingly:

```
export whizard_dir=$(pwd)
sed -i "s|__WHIZARD_DIR__|$whizard_dir|g" s3df_slurm_submission_setup/Hss_whizard_S3DF_SLURM_submission.sh
sed -i "s|__WHIZARD_DIR__|$whizard_dir|g" s3df_slurm_submission_setup/myJobPayload.sh
```

and run the job submission script:

```
source s3df_slurm_submission_setup/Hss_whizard_S3DF_SLURM_submission.sh
```

Jobs should be completed within ~10 mins. A few resubmissions might be necessary to ensure they've all been completed.


## Delphes

To run Delphes fast simulation, we first need to fetch the Delphes cards we need. In this study, we use the IDEA and FCCeeDetWithSiTracking detectors from the [central Delphes repo](https://github.com/delphes/delphes/tree/master/cards) as well as the [latest SiD card](https://github.com/dntounis/SiD_Delphes/blob/new_SiD_card/delphes_card_DSiD_Jim_dndx_TrkCov_E.tcl) (as of December 2024).

To get these cards, cd to the Delphes directory and run the script below:

```
source fetch_Delphes_cards.sh
```

Then, to set the correct paths:

```
export delphes_dir=$(pwd)
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/Hss_Delphes_S3DF_SLURM_submission.sh
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/myJobPayload_production.sh
sed -i "s|__WHIZARD_DIR__|$whizard_dir|g" s3df_slurm_submission_setup/myJobPayload_production.sh
```

For SiD detector variations studies, fetch these additional Delphes cards:

```
source fetch_Delphes_cards_SiD_variations.sh
```

and, likewise, to set the correct paths:


```
export delphes_dir=$(pwd)
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/Hss_Delphes_SiD_variations_S3DF_SLURM_submission.sh
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/myJobPayload_production_SiD_variations.sh
sed -i "s|__WHIZARD_DIR__|$whizard_dir|g" s3df_slurm_submission_setup/myJobPayload_production_SiD_variations.sh
```

Before running the job submision scripts, we have to create the directory structure that the submision scripts expect in order to save the Delphes outputs correctly:

```
source create_Delphes_directories.sh
#and likewise for SiD detector variation studies
source create_Delphes_directories_SiD_variations.sh
```




## FCCAnalyses - preprocessing

Once the Delphes samples have been produced, FCCAnalyses is used to preprocess them and create flat, per-jet Ntuples.

To set the paths correctly, after cd-ing to the FCCAnalyses_Winter2023 directory, run the script below:

```
source set_paths_fccana.sh
```

In stage 1, the PF Candidates are clustered in jets and in stage 2, the trees are flattened to have one entry per jet.

*Caution*: before running Stage 1, make sure you set the number of jets in `examples/FCCee/weaver/config.py` according to the Physics process simulated.



After completing stage1 and before moving on to stage2, we need to create the qq class by merging the uu and dd files. To do this:

```
source create_qq_class_files.sh
# for SiD variations
source create_qq_class_files_SiD_variations.sh
```



## Training in weaver

## FCCAnalyses - inference
