library(lme4)
library(glmulti)
load("hide/glmulti_environment_msc.Rdata")

chunkZZZ <- glmulti(y=spmsc_form,
                    level=1,
                    fitfunc=lmer_wrapper,
                    data=spmsc_imputed,
                    crit="aic",
                    confsetsize=2000,
                    maxsize=4,
                    chunks=25,
                    chunk=ZZZ,
                    method="h",
                    report=T,
                    plotty=F,
                    includeobjects=F)

save(chunkZZZ,file="chunkZZZ.Rdata")
