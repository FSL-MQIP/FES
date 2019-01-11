library(glmulti)
library(lme4)
load("glmulti_environment_msc.Rdata")

# Load all chunks
for(f in dir(".")) {
  if(grepl("Rdata",f)) {
    load(f)
  }
}

spmsc_consensus <- consensus(lapply(ls(pattern="chunk"),
                                  FUN=function(x) {get(x)}),confsetsize=1e6,
                           includeobjects=T)

library(MuMIn)
spmsc_avg <- model.avg(spmsc_consensus@objects)

library(dplyr)
importance <- data.frame(name=attributes(spmsc_avg$importance)$names,
                         n.models=attributes(spmsc_avg$importance)$n.models,
                         importance=spmsc_avg$importance) %>% as.tbl()

write.csv(importance,file="spmsc_importance.csv")
write.csv(summary(spmsc_avg)$coefmat.full,file="spmsc_full_model_average.csv")
sink(file="spmsc_avg_summary.txt")
summary(spmsc_avg)
sink()
