#!/bin/bash

detectors=("SiD_2024_2T" "SiD_2024_3T" "SiD_2024_4T"
           "SiD_2024_1stvtx_10mm" "SiD_2024_1stvtx_12mm" "SiD_2024_1stvtx_16mm"
           "SiD_2024_ECALenrel_5%" "SiD_2024_ECALenrel_15%" "SiD_2024_ECALenrel_20%" "SiD_2024_ECALenrel_25%"
           "SiD_2024_HCALenrel_15%" "SiD_2024_HCALenrel_30%" "SiD_2024_HCALenrel_60%" "SiD_2024_HCALenrel_75%"
           "SiD_2024_ECALsprel_0p5mm" "SiD_2024_ECALsprel_2mm" "SiD_2024_ECALsprel_5mm"
           "SiD_2024_HCALsprel_1cm" "SiD_2024_HCALsprel_5cm" "SiD_2024_HCALsprel_7cm")

processes=("nunuH")

cd production_for_training_Oct2024/SiD_variations


# Iterate through each directory
for detector in "${detectors[@]}"
do

    for process in "${processes[@]}"
    do 

        if [[ "$process" == "Z" ]]; then
            file_starting_name="z"
        elif [[ "$process" == "Z_v2" ]]; then
            file_starting_name="z_v2"
        elif [[ "$process" == "nunuH" ]]; then
            file_starting_name="zhiggs"
        elif [[ "$process" == "nunuHH" ]]; then
            file_starting_name="zhiggshiggs"
        fi

        mkdir  -p ${file_starting_name}_qq_${detector} && cd ${file_starting_name}_qq_${detector}

        # Copy files with appropriate numbering
        for i in {0..39}
        do
            # Calculate the source and destination file names based on the index
            if [[ $((i % 2)) -eq 0 ]]; then
                # Even index: copy uu files

                if [[ "$process" == "Z" ]]; then
                    src_file="../${file_starting_name}_uu_${detector}/${file_starting_name}_uu_DELPHES_${detector}_$((i/2)).edm4hep.root"
                elif [[ "$process" == "Z_v2" ]]; then
                    src_file="../${file_starting_name}_uu_${detector}/${file_starting_name}_uu_DELPHES_${detector}_$((i/2)).edm4hep.root"
                elif [[ "$process" == "nunuH" ]]; then
                    src_file="../${file_starting_name}_uu_${detector}/${file_starting_name}_nunu_uu_DELPHES_${detector}_$((i/2)).edm4hep.root"
                elif [[ "$process" == "nunuHH" ]]; then
                    src_file="../${file_starting_name}_uu_${detector}/${file_starting_name}_nunu_4u_DELPHES_${detector}_$((i/2)).edm4hep.root"
                fi

            else
                # Odd index: copy dd files

                if [[ "$process" == "Z" ]]; then
                    src_file="../${file_starting_name}_dd_${detector}/${file_starting_name}_dd_DELPHES_${detector}_$((i/2)).edm4hep.root"
                elif [[ "$process" == "Z_v2" ]]; then
                    src_file="../${file_starting_name}_dd_${detector}/${file_starting_name}_dd_DELPHES_${detector}_$((i/2)).edm4hep.root"
                elif [[ "$process" == "nunuH" ]]; then
                    src_file="../${file_starting_name}_dd_${detector}/${file_starting_name}_nunu_dd_DELPHES_${detector}_$((i/2)).edm4hep.root"
                elif [[ "$process" == "nunuHH" ]]; then
                    src_file="../${file_starting_name}_dd_${detector}/${file_starting_name}_nunu_4d_DELPHES_${detector}_$((i/2)).edm4hep.root"
                fi
            fi
            
            
            if [[ "$process" == "Z" ]]; then
                dest_file="${file_starting_name}_qq_DELPHES_${detector}_$i.edm4hep.root"
            elif [[ "$process" == "Z_v2" ]]; then
                dest_file="${file_starting_name}_qq_DELPHES_${detector}_$i.edm4hep.root"
            elif [[ "$process" == "nunuH" ]]; then
                dest_file="${file_starting_name}_nunu_qq_DELPHES_${detector}_$i.edm4hep.root"
            elif [[ "$process" == "nunuHH" ]]; then
                dest_file="${file_starting_name}_nunu_4q_DELPHES_${detector}_$i.edm4hep.root"
            fi



            # Perform the copy operation
            if [[ -f $src_file ]]; then
                cp "$src_file" "$dest_file"
                echo "Copied $src_file to $dest_file"
            else
                echo "Source file $src_file does not exist, skipping..."
            fi
        done

        # Go back to the original directory 
       cd - > /dev/null


    done
done
