setwd("/Users/titlis/cogsci/projects/stanford/projects/black_lives_matter/results/")
source("rscripts/helpers.R")

##################################
# first time read speaker results
ds = read.table("data/speaker.csv",sep=",")
colnames(ds) = c("QUD","State","Lambda","Utterance","Probability")
ds$White = ifelse(ds$State %in% c("BW","bW"), T, F)
ds$Black = ifelse(ds$State %in% c("BW","Bw"), T, F)

ds[ds$State == "bw",]
ggplot(ds[ds$Lambda == 1,], aes(x=State,fill=Utterance,y=Probability)) +
  geom_bar(stat="identity",color="black",position="dodge") +
  facet_wrap(~QUD) +
  ylim(0,1) +
  ylab("Probability of utterance") 
ggsave("graphs/speaker_joint.pdf",height=3,width=6)

ds_marg = ds %>%
  group_by(QUD,Lambda,Utterance) %>%
  summarise(Marginal = sum(Probability/4))
ggplot(ds_marg[ds_marg$Lambda == 1,], aes(x=QUD,fill=Utterance,y=Marginal)) +
  geom_bar(stat="identity",color="black",position="dodge") +
  ylim(0,1) +
  ylab("Probability of utterance") 

ds_marg_white = ds %>%
  group_by(White, QUD, Lambda, Utterance) %>%
  summarise(Marginal = sum(Probability)/2)
head(ds_marg_white)
ds_marg_white = as.data.frame(ds_marg_white)
ds_marg_white = rbind(ds_marg_white,data.frame(White=c(F,F,T),QUD=rep("which_lm",3),Lambda=rep(1,3),Utterance=c("alm","wlm","nlm"),Marginal=rep(0,3)))
ds_marg_white$Utterance = factor(x=as.character(ds_marg_white$Utterance),levels=c("blm","wlm","alm","nlm"))
ds_marg_white$White = ifelse(ds_marg_white$White,"w","!w")

ggplot(ds_marg_white[ds_marg_white$Lambda == "1",], aes(x=White,fill=Utterance,y=Marginal)) +
  geom_bar(stat="identity",color="black",position="dodge") +
  facet_wrap(~QUD) +
  # ylim(0,1) +
  ylab("Probability") +
  theme(axis.title.x=element_blank(),legend.position="top")
ggsave("graphs/speaker_marginal_white.pdf",height=3,width=5)

##################################
# first time read qud inference listener results
dl = read.table("data/listener.csv",sep=",")
colnames(dl) = c("Utterance","Lambda","QUD","Probability")
head(dl)

write.csv(dl,file="data/listener_qudinf_uniformprior.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_qudinf_wskewed.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_qudinf_bskewed.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_qudinf_bwskewed.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_qudinf_noneskewed.csv",row.names=F,quote=F)
##################################

dl = read.csv("data/listener_qudinf_uniformprior.csv")
dw = read.csv("data/listener_qudinf_wskewed.csv")
db = read.csv("data/listener_qudinf_bskewed.csv")
dbw = read.csv("data/listener_qudinf_bwskewed.csv")
dnone = read.csv("data/listener_qudinf_noneskewed.csv")
dl$Prior = "uniform"
dw$Prior = "realist"
db$Prior = "white_victim"
dbw$Prior = "optimist"
dnone$Prior = "pessimist"
d = rbind(dl,dw,db,dbw,dnone)
d$Prior = factor(x=as.character(d$Prior),levels=c("uniform","realist","white_victim","optimist","pessimist"))

ggplot(d[d$Lambda == 1 & d$QUD == "which_lm",], aes(x=Prior,y=Probability)) +
  geom_bar(stat="identity") +
  ylim(0,1) +
  ylab("Probability of 'which_lm'") +
  theme(axis.text.x=element_text(size=14))
ggsave("graphs/qud_inference_byprior.pdf",height=3.7,width=6)

##################################
# first time read qud inference listener results for "all lives matter"
dl = read.table("data/listener.csv",sep=",")
colnames(dl) = c("Utterance","Lambda","QUD","Probability")
head(dl)

write.csv(dl,file="data/listener_qudinf_alm_uniformprior.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_qudinf_alm_wskewed.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_qudinf_alm_bskewed.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_qudinf_alm_bwskewed.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_qudinf_alm_noneskewed.csv",row.names=F,quote=F)
##################################

dl = read.csv("data/listener_qudinf_alm_uniformprior.csv")
dw = read.csv("data/listener_qudinf_wskewed.csv")
db = read.csv("data/listener_qudinf_bskewed.csv")
dbw = read.csv("data/listener_qudinf_bwskewed.csv")
dnone = read.csv("data/listener_qudinf_noneskewed.csv")
dl$Prior = "uniform"
dw$Prior = "realist"
db$Prior = "white_victim"
dbw$Prior = "optimist"
dnone$Prior = "pessimist"
d = rbind(dl,dw,db,dbw,dnone)
d$Prior = factor(x=as.character(d$Prior),levels=c("uniform","realist","white_victim","optimist","pessimist"))

ggplot(d[d$Lambda == 1 & d$QUD == "which_lm",], aes(x=Prior,y=Probability)) +
  geom_bar(stat="identity") +
  ylim(0,1) +
  ylab("Probability of 'which_lm'") +
  theme(axis.text.x=element_text(size=14))
ggsave("graphs/qud_inference_byprior.pdf",height=3.7,width=6)

##################################
# first time read listener results
dl = read.table("data/listener.csv",sep=",")
colnames(dl) = c("Utterance","QUD","Lambda","State","Probability")
dl$State = rep(c("black_white","black_nwhite","nblack_white","nblack_nwhite"),nrow(dl)/4)
dl$White = rep(c(T,F,T,F),nrow(dl)/4)
dl$Black = rep(c(T,T,F,F),nrow(dl)/4)
head(dl)

write.csv(dl,file="data/listener_uniformprior.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_wskewed.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_bskewed.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_bwskewed.csv",row.names=F,quote=F)
write.csv(dl,file="data/listener_noneskewed.csv",row.names=F,quote=F)

##################################

# once saved start here with loading results
dl = read.csv("data/listener_uniformprior.csv")
dl = read.csv("data/listener_wskewed.csv")
dl = read.csv("data/listener_bskewed.csv")
dl = read.csv("data/listener_bwskewed.csv")
dl = read.csv("data/listener_noneskewed.csv")


# marginal probability of black lives mattering is always 1, but white lives always < 1
ggplot(dl[!dl$White & dl$Lambda == 1,], aes(x=QUD,y=Probability)) +
  geom_bar(stat="identity",fill="rosybrown1",color="black") +
  ylim(0,1) +
  ylab("Probability of !w") +
  theme(axis.text.x=element_text(size=10))
ggsave("graphs/listener_uniformprior.pdf",width=2.5,height=3.5)
ggsave("graphs/listener_w_skewed.pdf",width=2.5,height=3.5)
ggsave("graphs/listener_b_skewed.pdf",width=2.5,height=3.5)
ggsave("graphs/listener_bw_skewed.pdf",width=2.5,height=3.5)
ggsave("graphs/listener_none_skewed.pdf",width=2.5,height=3.5)


######### PLOTS FOR PARIS TALK
# b and w matter
speaker = data.frame(Utterance = factor(x=c("blm","wlm","alm","nlm"),levels=c("blm","wlm","alm","nlm")),Probability=c(.25,.25,.5,0))
ggplot(speaker, aes(x=Utterance,y=Probability)) +
  geom_bar(stat="identity")
ggsave("graphs/simplespeaker.pdf",height=2.5,width=3)

# only b matter
speaker = data.frame(Utterance = factor(x=c("blm","wlm","alm","nlm"),levels=c("blm","wlm","alm","nlm")),Probability=c(1,0,0,0))
ggplot(speaker, aes(x=Utterance,y=Probability)) +
  geom_bar(stat="identity")
ggsave("graphs/simplespeaker_b.pdf",height=2.5,width=3)

# pragmatic listener who hears "blm" under "whichlm" qud
listener = data.frame(State = factor(x=c("b & w","b & !w", "!b & w", "!b & !w"),levels=c("b & w","b & !w", "!b & w", "!b & !w")), Probability = c(.2, .8, 0, 0))
ggplot(listener, aes(x=State,y=Probability)) +
  geom_bar(stat="identity",fill="rosybrown1",color="black") + 
  theme(axis.text.x = element_text(angle=45,vjust=1,hjust=1),axis.title=element_text(size=13))
ggsave("graphs/simplelistener.pdf",height=2,width=2.5)

# pragmatic listener who hears "blm" with only two alternatives
listener = data.frame(Alternatives = factor(x=c("full", "restricted"),levels=c("restricted","full")), Probability = c(.8, .5))
ggplot(listener, aes(x=Alternatives,y=Probability)) +
  geom_bar(stat="identity",fill="rosybrown1",color="black") +
  ylab("Probability of !w")
  # theme(axis.text.x = element_text(angle=45,vjust=1,hjust=1),axis.title=element_text(size=13))
ggsave("graphs/simplelistener_restr.pdf",height=3,width=2.2)

# different priors
pr = data.frame(State = factor(x=rep(c("b & w","b & !w", "!b & w", "!b & !w"),5),levels=c("b & w","b & !w", "!b & w", "!b & !w")),Prior=factor(x=rep(c("uniform","white-skewed","black-skewed","all-matter","none-matter"),each=4),levels=c("uniform","white-skewed","black-skewed","all-matter","none-matter")),Probability=c(.25,.25,.25,.25,.03,.03,.91,.03,.03,.91,.03,.03,.91,.03,.03,.03,.03,.03,.03,.91))

ggplot(pr, aes(x=State,y=Probability)) +
  geom_bar(stat="identity") +
  facet_wrap(~Prior,nrow=1) +
  theme(axis.text.x = element_text(angle=45,vjust=1,hjust=1))
ggsave("graphs/priors.pdf",height=3,width=8)
