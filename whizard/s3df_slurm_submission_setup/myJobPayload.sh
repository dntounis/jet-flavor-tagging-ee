#!/bin/bash
# This is the payload script that runs the actual job commands

flavor=$1
number=$2
process=$3

echo "Running Whizard for flavor $flavor with number ${number}"

#cd Hss_setup_test/whizard_v2/
#cd /fs/ddn/sdf/group/atlas/d/dntounis/Hss_setup_test/whizard_v2/$flavor
cd __WHIZARD_DIR__/$flavor

#source /cvmfs/sw.hsf.org/spackages6/key4hep-stack/2022-12-23/x86_64-centos7-gcc11.2.0-opt/ll3gi/setup.sh
source /cvmfs/sw-nightlies.hsf.org/key4hep/setup.sh


SIN_FILE="wzp6_ee_nunuH_H${flavor}_ecm250.sin"
TEMP_SIN_FILE="wzp6_ee_nunuH_H${flavor}_ecm250_${number}.sin"

# choose one from Z,nunuH and nunuHH


if [[ "$process" == "Z" ]]; then
    SIN_FILE="wzp6_ee_Z${flavor}_ecm91p2.sin"
    TEMP_SIN_FILE="wzp6_ee_Z${flavor}_ecm91p2_${number}.sin"
elif [[ "$process" == "nunuH" ]]; then
    SIN_FILE="wzp6_ee_nunuH_H${flavor}_ecm250.sin"
    TEMP_SIN_FILE="wzp6_ee_nunuH_H${flavor}_ecm250_${number}.sin"
elif [[ "$process" == "nunuHH" ]]; then
    SIN_FILE="wzp6_ee_nunuHH_H${flavor}_H${flavor}_ecm550.sin"
    TEMP_SIN_FILE="wzp6_ee_nunuHH_H${flavor}_H${flavor}_ecm550_${number}.sin"
fi


cp $SIN_FILE $TEMP_SIN_FILE

# Modify the sample name in the temporary .sin file by appending _NUMBER
sed -i "s/\$sample = \"\(.*\)\"/\$sample = \"\1_${number}\"/" $TEMP_SIN_FILE
#sed -i "s/procH/procH_${number}/g" $TEMP_SIN_FILE

# Run the Whizard simulation using the modified .sin file
#whizard --rebuild $TEMP_SIN_FILE
whizard $TEMP_SIN_FILE

# Clean up temporary .sin file (optional)
#rm $TEMP_SIN_FILE
