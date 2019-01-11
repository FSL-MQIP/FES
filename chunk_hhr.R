library(lme4)
library(glmulti)
load("hide/glmulti_environment_hhr.Rdata")

chunkZZZ <- glmulti(y=hhr_form,
                    level=1,
                    fitfunc=glmer_wrapper,
                    data=hhr_imputed,
                    crit="aic",
                    confsetsize=2000,
                    maxsize=4,
                    chunks=20,
                    chunk=ZZZ,
                    method="h",
                    report=T,
                    plotty=F,
                    bunch=2,
                    includeobjects=F)

save(chunkZZZ,file="chunkZZZ.Rdata")
warnings()
