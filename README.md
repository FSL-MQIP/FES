# FES
Git repository for "Bacterial spore levels in bulk tank raw milk are influenced
by environmental and cow hygiene factors"

`chunk_*.R` is a prototype for fitting the models with `glmulti`, used to parallelize the process simply by replacing the `ZZZ` as appropriate and running the scripts in parallel. `glmulti_environment_*.Rdata` contain the environments for the `chunk_*.R` scripts. `*_consensus.R` reads in the `Rdata` files generated by the `chunk_*.R` scripts, produces a consensus object and writes the relevant output of this, the results of which are stored in the `results` folder.
