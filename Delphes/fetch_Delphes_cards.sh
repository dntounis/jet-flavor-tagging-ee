# Create and enter directory for first repo
mkdir delphes_repo
cd delphes_repo

# Initialize and fetch from first repo
git init
git remote add origin https://github.com/delphes/delphes.git
git sparse-checkout init
git sparse-checkout set cards/delphes_card_IDEA.tcl cards/delphes_card_FCCeeDetWithSiTracking.tcl
git pull origin master --allow-unrelated-histories

cp cards/* ../

# Go back and create directory for second repo
cd ..
mkdir sid_delphes_repo
cd sid_delphes_repo

# Initialize and fetch from second repo
git init
git remote add origin https://github.com/dntounis/SiD_Delphes.git
git sparse-checkout init
git sparse-checkout set SiD_params delphes_card_DSiD_Jim_dndx_TrkCov_E.tcl
git pull origin main --allow-unrelated-histories

cp delphes_card_DSiD_Jim_dndx_TrkCov_E.tcl ../delphes_card_SiD_2024.tcl
cp -avr SiD_params ../

# Move back to original directory and delete directories from remote repos
cd ../
rm -rf delphes_repo sid_delphes_repo
