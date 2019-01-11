library(glmulti)
library(lme4)
load("hide/glmulti_environment_bab.Rdata")

for(f in dir(".")) {
  if(grepl("Rdata",f)) {
    load(f)
  }
}

bab_consensus <- consensus(lapply(ls(pattern="chunk"),
                                    FUN=function(x) {get(x)}),confsetsize=1e6,
                             includeobjects=T)

library(MuMIn)
bab_avg <- model.avg(bab_consensus@objects)

library(dplyr)
importance <- data.frame(name=attributes(bab_avg$importance)$names,
                         n.models=attributes(bab_avg$importance)$n.models,
                         importance=bab_avg$importance) %>% as.tbl()

write.csv(importance,file="bab_importance.csv")
write.csv(summary(bab_avg)$coefmat.full,file="bab_full_model_average.csv")
sink(file="bab_avg_summary.txt")
summary(bab_avg)
sink()
