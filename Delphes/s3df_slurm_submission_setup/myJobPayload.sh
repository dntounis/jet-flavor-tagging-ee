#!/bin/bash
# This is the payload script that runs the actual job commands

flavor=$1
number=$2
#short_flavor=${flavor:0:1}

if [ "$flavor" == "tautau" ]; then
    short_flavor="tau"
else
    # Otherwise, keep only the first character of the flavor string
    short_flavor=${flavor:0:1}
fi

# e.g. if flavor is gg then short_flavor is g #Jim

echo "Running Delphes for flavor $flavor"

#cd Hss_setup_test/whizard_v2/
cd /fs/ddn/sdf/group/atlas/d/dntounis/Hss_setup_test/Delphes/zhiggs_${flavor}_SiD_o2_v04_C_Oct24
#cd /fs/ddn/sdf/group/atlas/d/dntounis/Hss_setup_test/Delphes/zhiggs_${flavor}_IDEA_Oct24


source /cvmfs/sw.hsf.org/spackages6/key4hep-stack/2022-12-23/x86_64-centos7-gcc11.2.0-opt/ll3gi/setup.sh

echo ${HOME}/Hss_setup_test/whizard_v2/zhiggs_${flavor}/zhiggs_nu_nu_${short_flavor}_${short_flavor}.stdhep

#DelphesSTDHEP_EDM4HEP ../delphes_card_DSiD_Jim_dndx_TrkCov.tcl ${K4SIMDELPHES}/edm4hep_output_config.tcl zhiggs_nunu_${flavor}_DELPHES_test_o2_v04_B_1Mevents_SiD_Winter2023_v2.edm4hep.root  ${HOME}/Hss_setup_test/whizard_v2/zhiggs_${flavor}/zhiggs_nu_nu_${short_flavor}_${short_flavor}.stdhep

#DelphesSTDHEP_EDM4HEP ../delphes_card_DSiD_Jim_dndx_TrkCov_C.tcl ${K4SIMDELPHES}/edm4hep_output_config.tcl zhiggs_nunu_${flavor}_DELPHES_SiD_o2_v04_C_Winter2023_${number}.edm4hep.root ${HOME}/Hss_setup_test/whizard_v2/zhiggs_${flavor}/zhiggs_nu_nu_${short_flavor}_${short_flavor}_${number}.stdhep

DelphesSTDHEP_EDM4HEP ../delphes_card_IDEA_Winter2023.tcl ${K4SIMDELPHES}/edm4hep_output_config.tcl zhiggs_nunu_${flavor}_DELPHES_IDEA_Winter2023_${number}.edm4hep.root  ${HOME}/Hss_setup_test/whizard_v2/zhiggs_${flavor}/zhiggs_nu_nu_${short_flavor}_${short_flavor}_${number}.stdhep


