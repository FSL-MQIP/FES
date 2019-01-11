library(lme4)
library(glmulti)
load("hide/glmulti_environment_tsc.Rdata")

chunkZZZ <- glmulti(y=sptsc_form,
                    level=1,
                    fitfunc=lmer_wrapper,
                    data=sptsc_imputed,
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
