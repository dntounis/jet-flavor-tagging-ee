
flavors=("uu" "dd" "cc" "ss" "bb" "gg")
processes=("Z" "Z_v2" "nunuH" "nunuHH")
detectors=("SiD_2024" "IDEA" "FCCeeDetWithSiTracking")


mkdir  production_for_training_Oct2024

for flavor in "${flavors[@]}"; do
  for process in "${processes[@]}"; do
    for detector in "${detectors[@]}"; do
      if [[ "$process" == "Z" ]]; then
        mkdir -p "production_for_training_Oct2024/z_${flavor}_${detector}"
      elif [[ "$process" == "Z_v2" ]]; then
        mkdir -p "production_for_training_Oct2024/z_v2_${flavor}_${detector}"
      elif [[ "$process" == "nunuH" ]]; then
        mkdir -p "production_for_training_Oct2024/zhiggs_${flavor}_${detector}"
      elif [[ "$process" == "nunuHH" ]]; then
        mkdir -p "production_for_training_Oct2024/zhiggshiggs_${flavor}_${detector}"
      fi
    done
  done
done
