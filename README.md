# Jet Flavor Tagging studies for future e+e- colliders

Repository for jet flavor tagging studies for future electron-positron colliders using Delphes fast simulation


```
git clone https://github.com/dntounis/Hss_studies.git .
git submodule update --init --recursive

```


<img width="910" alt="image" src="https://github.com/user-attachments/assets/841c5d37-1118-4aec-899c-07e616c568e2">


## Analysis steps

1. Generation of hard-scatter (HS) Physics processes - done in [whizard](https://whizard.hepforge.org/)
2. Simulation of the interaction of particles from HS events with a detector - using [Delphes](https://github.com/delphes/delphes) fast simulation
3. Clustering of Particle-Flow objects (PFOs) into jets and flat tree creation using [FCCAnalyses](https://github.com/HEP-FCC/FCCAnalyses)
4. Training of NN tagger with [weaver](https://github.com/hqucms/weaver-core)
5. Running inference in [FCCAnalyses](https://github.com/HEP-FCC/FCCAnalyses)


## Whizard

## Delphes

## FCCAnalyses - preprocessing

## Training in weaver

## FCCAnalyses - inference
