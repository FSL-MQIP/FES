library(glmulti)
library(lme4)
load("glmulti_environment_tsc.Rdata")

# Load all chunks
for(f in dir(".")) {
  if(grepl("Rdata",f)) {
    load(f)
  }
}

sptsc_consensus <- consensus(lapply(ls(pattern="chunk"),
                                  FUN=function(x) {get(x)}),confsetsize=1e6,
                           includeobjects=T)

library(MuMIn)
sptsc_avg <- model.avg(sptsc_consensus@objects)

library(dplyr)
importance <- data.frame(name=attributes(sptsc_avg$importance)$names,
                         n.models=attributes(sptsc_avg$importance)$n.models,
                         importance=sptsc_avg$importance) %>% as.tbl()

write.csv(importance,file="sptsc_importance.csv")
write.csv(summary(sptsc_avg)$coefmat.full,file="sptsc_full_model_average.csv")
sink(file="sptsc_avg_summary.txt")
summary(sptsc_avg)
sink()
