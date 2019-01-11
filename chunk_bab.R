library(lme4)
library(glmulti)
load("hide/glmulti_environment_bab.Rdata")

chunkZZZ <- glmulti(y=bab_form,
                    level=1,
                    fitfunc=glmer_wrapper,
                    data=bab_imputed,
                    crit="aic",
                    confsetsize=1e6,
                    maxsize=4,
                    chunks=10,
                    chunk=ZZZ,
                    method="h",
                    report=T,
                    plotty=F,
                    includeobjects=T)

save(chunkZZZ,file="chunkZZZ.Rdata")
warnings()
