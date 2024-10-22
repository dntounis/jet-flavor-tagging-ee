#!/bin/bash

# Array of directories
detectors=("IDEA" "SiD_o2_v04_C" "SiD_o2_v04_D")
#detectors=("SiD_o2_v04_D")

# Iterate through each directory
for detector in "${detectors[@]}"
do
    # Change into the detector directory
    cd zhiggs_qq_"$detector"_Oct24 || { echo "Directory $detector not found"; exit 1; }

    # Copy files with appropriate numbering
    for i in {18..29}
    do
        # Calculate the source and destination file names based on the index
        if [[ $((i % 2)) -eq 0 ]]; then
            # Even index: copy test_Huu files
            src_file="../zhiggs_uu_${detector}_Oct24/zhiggs_nunu_uu_DELPHES_${detector}_Winter2023_$i.edm4hep.root"
        else
            # Odd index: copy test_Hdd files
            src_file="../zhiggs_dd_${detector}_Oct24/zhiggs_nunu_dd_DELPHES_${detector}_Winter2023_$i.edm4hep.root"
        fi
        
        dest_file="zhiggs_nunu_qq_DELPHES_${detector}_Winter2023_$i.edm4hep.root"

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
