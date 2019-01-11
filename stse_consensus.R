library(glmulti)
library(lme4)
load("hide/glmulti_environment_stse.Rdata")

for(f in dir(".")) {
  if(grepl("Rdata",f)) {
    load(f)
  }
}

stse_consensus <- consensus(lapply(ls(pattern="chunk"),
                                    FUN=function(x) {get(x)}),confsetsize=1e6,
                             includeobjects=T)

library(MuMIn)
stse_avg <- model.avg(stse_consensus@objects)

library(dplyr)
importance <- data.frame(name=attributes(stse_avg$importance)$names,
                         n.models=attributes(stse_avg$importance)$n.models,
                         importance=stse_avg$importance) %>% as.tbl()

write.csv(importance,file="stse_importance.csv")
write.csv(summary(stse_avg)$coefmat.full,file="stse_full_model_average.csv")
sink(file="stse_avg_summary.txt")
summary(stse_avg)
sink()
