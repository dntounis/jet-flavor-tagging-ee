#!/bin/bash
# This is the payload script that runs the actual job commands

flavor=$1
number=$2
process=$3
detector=$4
#short_flavor=${flavor:0:1}

if [ "$flavor" == "tautau" ]; then
    short_flavor="tau"
else
    # Otherwise, keep only the first character of the flavor string
    short_flavor=${flavor:0:1}
fi



# e.g. if flavor is gg then short_flavor is g #Jim

echo "Running Delphes for flavor $flavor with number $number , process $process  and detector $detector"

#cd Hss_setup_test/whizard_v2/


#cd /fs/ddn/sdf/group/atlas/d/dntounis/Hss_setup_test/Delphes/production_for_training_Oct2024/zhiggs_${flavor}_SiD_o2_v04_C_Oct24
#cd /fs/ddn/sdf/group/atlas/d/dntounis/Hss_setup_test/Delphes/production_for_training_Oct2024/zhiggs_${flavor}_IDEA_Oct24
#cd /fs/ddn/sdf/group/atlas/d/dntounis/Hss_setup_test/Delphes/production_for_training_Oct2024/zhiggs_${flavor}_SiD_o2_v04_D_Oct24

if [[ "$process" == "Z" ]]; then
    cd /fs/ddn/sdf/group/atlas/d/dntounis/Hss_setup_test/Delphes/production_for_training_Oct2024/z_${flavor}_${detector}
elif [[ "$process" == "nunuH" ]]; then
    cd /fs/ddn/sdf/group/atlas/d/dntounis/Hss_setup_test/Delphes/production_for_training_Oct2024/zhiggs_${flavor}_${detector}
elif [[ "$process" == "nunuHH" ]]; then
    cd /fs/ddn/sdf/group/atlas/d/dntounis/Hss_setup_test/Delphes/production_for_training_Oct2024/zhiggshiggs_${flavor}_${detector}
fi

source /cvmfs/sw.hsf.org/spackages6/key4hep-stack/2022-12-23/x86_64-centos7-gcc11.2.0-opt/ll3gi/setup.sh

if [[ "$process" == "Z" ]]; then
    echo ${HOME}/Hss_setup_test/whizard_v2/production_for_training_Oct2024/zhiggs_${flavor}/z_${short_flavor}_${short_flavor}.stdhep
    DelphesSTDHEP_EDM4HEP ../../delphes_card_${detector}.tcl ${K4SIMDELPHES}/edm4hep_output_config.tcl z_${flavor}_DELPHES_${detector}_${number}.edm4hep.root ${HOME}/Hss_setup_test/whizard_v2/production_for_training_Oct2024/z_${flavor}/z_${short_flavor}_${short_flavor}_${number}.stdhep
elif [[ "$process" == "nunuH" ]]; then
    echo ${HOME}/Hss_setup_test/whizard_v2/production_for_training_Oct2024/zhiggs_${flavor}/zhiggs_nu_nu_${short_flavor}_${short_flavor}.stdhep
    DelphesSTDHEP_EDM4HEP ../../delphes_card_${detector}.tcl ${K4SIMDELPHES}/edm4hep_output_config.tcl zhiggs_nunu_${flavor}_DELPHES_${detector}_${number}.edm4hep.root ${HOME}/Hss_setup_test/whizard_v2/production_for_training_Oct2024/zhiggs_${flavor}/zhiggs_nu_nu_${short_flavor}_${short_flavor}_${number}.stdhep
elif [[ "$process" == "nunuHH" ]]; then
    echo ${HOME}/Hss_setup_test/whizard_v2/production_for_training_Oct2024/zhiggs_${flavor}/zhiggs_nu_nu_4${short_flavor}.stdhep
    DelphesSTDHEP_EDM4HEP ../../delphes_card_${detector}.tcl ${K4SIMDELPHES}/edm4hep_output_config.tcl zhiggshiggs_nunu_4${short_flavor}_DELPHES_${detector}_${number}.edm4hep.root ${HOME}/Hss_setup_test/whizard_v2/production_for_training_Oct2024/zhiggshiggs_4${short_flavor}/zhiggs_nu_nu_4${short_flavor}_${number}.stdhep
fi



# C: correct SiD card
# D: SiD card with same calo performance as IDEA

#DelphesSTDHEP_EDM4HEP ../../delphes_card_DSiD_Jim_dndx_TrkCov_C.tcl ${K4SIMDELPHES}/edm4hep_output_config.tcl zhiggs_nunu_${flavor}_DELPHES_SiD_o2_v04_C_Winter2023_${number}.edm4hep.root ${HOME}/Hss_setup_test/whizard_v2/production_for_training_Oct2024/zhiggs_${flavor}/zhiggs_nu_nu_${short_flavor}_${short_flavor}_${number}.stdhep

#DelphesSTDHEP_EDM4HEP ../../delphes_card_IDEA_Winter2023.tcl ${K4SIMDELPHES}/edm4hep_output_config.tcl zhiggs_nunu_${flavor}_DELPHES_IDEA_Winter2023_${number}.edm4hep.root  ${HOME}/Hss_setup_test/whizard_v2/production_for_training_Oct2024/zhiggs_${flavor}/zhiggs_nu_nu_${short_flavor}_${short_flavor}_${number}.stdhep

#DelphesSTDHEP_EDM4HEP ../../delphes_card_DSiD_Jim_dndx_TrkCov_D.tcl ${K4SIMDELPHES}/edm4hep_output_config.tcl zhiggs_nunu_${flavor}_DELPHES_SiD_o2_v04_D_Winter2023_${number}.edm4hep.root ${HOME}/Hss_setup_test/whizard_v2/production_for_training_Oct2024/zhiggs_${flavor}/zhiggs_nu_nu_${short_flavor}_${short_flavor}_${number}.stdhep


