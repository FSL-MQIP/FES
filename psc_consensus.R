library(glmulti)
library(lme4)
load("hide/glmulti_environment_psc.Rdata")

for(f in dir(".")) {
  if(grepl("Rdata",f)) {
    load(f)
  }
}

sppsc_consensus <- consensus(lapply(ls(pattern="chunk"),
                                    FUN=function(x) {get(x)}),confsetsize=1e6,
                             includeobjects=T)

library(MuMIn)
sppsc_avg <- model.avg(sppsc_consensus@objects)
save(sppsc_consensus,file="sppsc_consensus.Rdata")
save(sppsc_avg,file="sppsc_avg.Rdata")

importance <- data.frame(name=attributes(sppsc_avg$importance)$names,
                         n.models=attributes(sppsc_avg$importance)$n.models,
                         importance=sppsc_avg$importance) %>% as.tbl()

write.csv(importance,file="sppsc_importance.csv")
write.csv(summary(sppsc_avg)$coefmat.full,file="sppsc_full_model_average.csv")
sink(file="sppsc_avg_summary.txt")
summary(sppsc_avg)
sink()

