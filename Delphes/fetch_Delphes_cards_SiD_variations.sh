# Create temp directoryo
mkdir sid_variations_delphes_repo
cd sid_variations_delphes_repo

# Initialize and fetch from second repo
git init
git remote add origin https://github.com/dntounis/SiD_Delphes.git
git sparse-checkout init
git sparse-checkout set SiD_params delphes_card_SiD_2024*.tcl
git pull origin SiD_variations --allow-unrelated-histories

cp delphes_card_SiD_2024*.tcl ../
cp SiD_params/* ../SiD_params/

# Move back to original directory and delete directories from remote repos
cd ../
rm -rf sid_variations_delphes_repo
