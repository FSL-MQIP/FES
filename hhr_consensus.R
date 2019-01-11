library(glmulti)
library(lme4)
load("hide/glmulti_environment_hhr.Rdata")

for(f in dir(".")) {
  if(grepl("Rdata",f)) {
    load(f)
  }
}

hhr_consensus <- consensus(lapply(ls(pattern="chunk"),
                                    FUN=function(x) {get(x)}),confsetsize=1e6,
                             includeobjects=T)

library(MuMIn)
hhr_avg <- model.avg(hhr_consensus@objects)

library(dplyr)
importance <- data.frame(name=attributes(hhr_avg$importance)$names,
                         n.models=attributes(hhr_avg$importance)$n.models,
                         importance=hhr_avg$importance) %>% as.tbl()

write.csv(importance,file="hhr_importance.csv")
write.csv(summary(hhr_avg)$coefmat.full,file="hhr_full_model_average.csv")
sink(file="hhr_avg_summary.txt")
summary(hhr_avg)
sink()
