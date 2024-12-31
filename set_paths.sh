

# --- Set the paths for the Whizard  repository --- #
export whizard_dir=$(pwd)/whizard
cd $whizard_dir
sed -i "s|__WHIZARD_DIR__|$whizard_dir|g" s3df_slurm_submission_setup/Hss_whizard_S3DF_SLURM_submission.sh
sed -i "s|__WHIZARD_DIR__|$whizard_dir|g" s3df_slurm_submission_setup/myJobPayload.sh
cd ../

# --- Set the paths for the Delphes  repository --- #
export delphes_dir=$(pwd)/Delphes
cd $delphes_dir
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/Hss_Delphes_S3DF_SLURM_submission.sh
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/myJobPayload_production.sh
sed -i "s|__WHIZARD_DIR__|$whizard_dir|g" s3df_slurm_submission_setup/myJobPayload_production.sh
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/Hss_Delphes_SiD_variations_S3DF_SLURM_submission.sh
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/myJobPayload_production_SiD_variations.sh
sed -i "s|__WHIZARD_DIR__|$whizard_dir|g" s3df_slurm_submission_setup/myJobPayload_production_SiD_variations.sh

cd ../


# --- Set the paths for the FCCAnalyses_Winter2023 repository --- #
export fccana_dir=$(pwd)/FCCAnalyses_Winter2023
cd $fccana_dir
sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/Hss_inference_S3DF_SLURM_submission.sh
sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/Hss_stage1_S3DF_SLURM_submission.sh
sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/Hss_stage2_S3DF_SLURM_submission.sh
sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/myJobPayload_inference_production.sh
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/myJobPayload_inference_production.sh
sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/myJobPayload_stage1_production.sh
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/myJobPayload_stage1_production.sh
sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/myJobPayload_stage2_production.sh

sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/Hss_inference_SiD_variations_S3DF_SLURM_submission.sh
sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/Hss_stage1_SiD_variations_S3DF_SLURM_submission.sh
sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/Hss_stage2_SiD_variations_S3DF_SLURM_submission.sh
sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/myJobPayload_inference_production_SiD_variations.sh
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/myJobPayload_inference_production_SiD_variations.sh
sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/myJobPayload_stage1_production_SiD_variations.sh
sed -i "s|__DELPHES_DIR__|$delphes_dir|g" s3df_slurm_submission_setup/myJobPayload_stage1_production_SiD_variations.sh
sed -i "s|__FCCANA_DIR__|$fccana_dir|g" s3df_slurm_submission_setup/myJobPayload_stage2_production_SiD_variations.sh



cd ../