library(lme4)
library(glmulti)
load("hide/glmulti_environment_psc.Rdata")

chunkZZZ <- glmulti(y=sppsc_form,
                    level=1,
                    fitfunc=lmer_wrapper,
                    data=sppsc_imputed,
                    crit="aic",
                    confsetsize=1e6,
                    maxsize=4,
                    chunks=20,
                    chunk=ZZZ,
                    method="h",
                    report=T,
                    plotty=F,
                    includeobjects=T)

save(chunkZZZ,file="chunkZZZ.Rdata")
