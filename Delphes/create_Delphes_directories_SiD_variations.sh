
flavors=("uu" "dd" "cc" "ss" "bb" "gg")
processes=("nunuH")
detectors=("SiD_2024_2T" "SiD_2024_3T" "SiD_2024_4T"
           "SiD_2024_1stvtx_10mm" "SiD_2024_1stvtx_12mm" "SiD_2024_1stvtx_16mm"
           "SiD_2024_ECALenrel_5%" "SiD_2024_ECALenrel_15%" "SiD_2024_ECALenrel_20%" "SiD_2024_ECALenrel_25%"
           "SiD_2024_HCALenrel_15%" "SiD_2024_HCALenrel_30%" "SiD_2024_HCALenrel_60%" "SiD_2024_HCALenrel_75%"
           "SiD_2024_ECALsprel_0p5mm" "SiD_2024_ECALsprel_2mm" "SiD_2024_ECALsprel_5mm"
           "SiD_2024_HCALsprel_1cm" "SiD_2024_HCALsprel_5cm" "SiD_2024_HCALsprel_7cm" )

cd  production_for_training_Oct2024
mkdir SiD_variations && cd SiD_variations


for flavor in "${flavors[@]}"; do
  for process in "${processes[@]}"; do
    for detector in "${detectors[@]}"; do
      if [[ "$process" == "Z" ]]; then
        mkdir  "z_${flavor}_${detector}"
      elif [[ "$process" == "Z_v2" ]]; then
        mkdir  "z_v2_${flavor}_${detector}"
      elif [[ "$process" == "nunuH" ]]; then
        mkdir  "zhiggs_${flavor}_${detector}"
      elif [[ "$process" == "nunuHH" ]]; then
        mkdir  "zhiggshiggs_${flavor}_${detector}"
      fi
    done
  done
done
