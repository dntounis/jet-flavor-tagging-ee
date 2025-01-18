detectors=("SiD_2024_nunuH"
	   "SiD_2024_nunuHH"
	   "IDEA_nunuH"
	   "FCCeeDetWithSiTracking_nunuH"
           "SiD_2024_1stvtx_10mm_nunuH"
           "SiD_2024_1stvtx_12mm_nunuH"
           "SiD_2024_1stvtx_16mm_nunuH"
           "SiD_2024_ECALenrel_5%_nunuH"
           "SiD_2024_ECALenrel_15%_nunuH"
           "SiD_2024_ECALenrel_20%_nunuH"
           "SiD_2024_ECALenrel_25%_nunuH"
)


# Iterate over each detector in the list
for detector in "${detectors[@]}"; do
    echo "Processing detector: $detector"

    # Construct model and ONNX file names
    model_file="models_January2025/PNet_${detector}_best_epoch_state.pt"
    onnx_file="PNet_${detector}.onnx"
    json_file="models_January2025/exported_models/PNet_${detector}.json"

    # Run weaver command
    weaver -c weaver_fccee_setup/data/fccee_hf_pf_full_Jim.yaml \
           -n weaver_fccee_setup/networks/particle_net_fccee.py \
           -m "$model_file" \
           --export-onnx "$onnx_file"

    # Copy preprocess.json to a detector-specific JSON file
    mv models_January2025/preprocess.json "$json_file"
    mv models_January2025/"$onnx_file" models_January2025/exported_models

    echo "Finished processing $detector"
    echo "------------------------------------------------"
done

echo "All detectors processed successfully."

