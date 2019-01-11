library(lme4)
library(glmulti)
load("hide/glmulti_environment_stse.Rdata")

chunkZZZ <- glmulti(y=stse_form,
                    level=1,
                    fitfunc=glmer_wrapper,
                    data=stse_imputed,
                    crit="aic",
                    confsetsize=2000,
                    maxsize=4,
                    chunks=20,
                    chunk=ZZZ,
                    method="h",
                    report=T,
                    plotty=F,
                    includeobjects=F)

save(chunkZZZ,file="chunkZZZ.Rdata")
warnings()
