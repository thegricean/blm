library(tidyverse)
library(forcats)
library(stringr)
library(ggplot2)

theme_set(theme_bw(18))
source("helpers.r")

d = read.table(file="../data/blm.csv",sep=",", header=T)
d = as.data.frame(lapply(d, function(x) {gsub('\"',"",x)}))

#hard-coded filtering for participants who reported a native language other than English 
d = d %>%
  filter(language != 'Bangla' & language != 'Bulgarian' & language != 'turkish' & language != 'Spanish' & language != 'spanish') %>%
  droplevels()

#head(d)
nrow(d)
summary(d)
d$Trial = as.numeric(as.character(d$slide_number)) - 2
d$Answer.time_in_minutes = as.numeric(as.character(d$Answer.time_in_minutes))
d$age = as.numeric(as.character(d$age))
length(unique(d$workerid))

# look at turker comments
unique(d$comments)

summary(d$Answer.time_in_minutes)
ggplot(d, aes(Answer.time_in_minutes)) +
  geom_histogram()

ggplot(d, aes(gender)) +
  stat_count()

ggplot(d, aes(asses)) +
  stat_count()

ggplot(d, aes(age)) +
  geom_histogram()
table(d$age)

ggplot(d, aes(education)) +
  stat_count()

ggplot(d, aes(language)) +
  stat_count() +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))

ggplot(d, aes(enjoyment)) +
  stat_count()

production = d %>%
  filter(block == "production") %>%
  droplevels()

identity = d %>%
  filter(block == "identity") %>%
  droplevels()

likeability = d %>%
  filter(block == "likeability") %>%
  droplevels() %>%
  mutate(response = as.numeric(as.character(response))) %>%
  mutate(response_2bins = cut(response, 2, labels = c("low", "high"))) %>%
  mutate(response_3bins = cut(response, 3, labels = c("low", "medium", "high")))

View(likeability)

nrow(production)
nrow(likeability)
nrow(identity)

ggplot(identity, aes(x=response, fill=nounclass)) +
  geom_histogram(stat="count") +
  facet_wrap(~noun)

ggplot(likeability, aes(x=response, fill=nounclass)) +
  geom_histogram(stat="count") +
  facet_wrap(~noun)

ggplot(likeability, aes(x=response, fill=nounclass)) +
  geom_density() +
  facet_wrap(~noun)

ggplot(likeability, aes(x=response, fill=noun)) +
  geom_density(alpha=.5) +
  facet_wrap(~nounclass)

ggplot(production, aes(x=class, fill=response)) +
  geom_histogram(stat="count",position="dodge") +
  facet_wrap(~noun) +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))

View(identity)

# get likeability means
agr = likeability %>%
  group_by(noun,nounclass) %>%
  summarize(Mean=mean(response),CILow=ci.low(response),CIHigh=ci.high(response)) %>%
  mutate(YMin=Mean-CILow,YMax=Mean+CIHigh)

ggplot(agr, aes(x=noun,y=Mean,fill=nounclass)) +
  geom_bar(stat="identity") +
  geom_errorbar(aes(ymin=YMin,ymax=YMax),width=.25) +
  facet_wrap(~nounclass,scales="free_x",nrow=1) +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))

ggplot(likeability, aes(x=noun,y=response,fill=nounclass)) +
  # geom_violin() +
  geom_boxplot() +
  facet_wrap(~nounclass,scales="free_x",nrow=1) +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))

# merge identity & likeability
like = likeability %>%
  select(workerid,noun,response,nounclass) %>%
  mutate(response_likeable = response) %>%
  select(-response)

id = identity %>%
  select(workerid,noun,response,nounclass) %>%
  mutate(response_identity = response) %>%
  left_join(like,by=c("workerid","noun","nounclass"))

View(id)

ggplot(id %>% filter(response_identity != "Confused"), aes(x=response_likeable, fill=response_identity)) +
  geom_density(alpha=.5) +
  facet_wrap(~noun)

#merge identity and production 
prod = production %>%
  select(workerid,noun,response,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

#Resolving incompatible values for 'Black lives matter' condition between identity and production
prod$noun <- gsub('Black lives', 'Black people', prod$noun)
#prod$noun_class <- gsub('black_lives', 'black', prod$nounclass)

######### PRODUCTION X IDENTITY ##########
id_collapsed_pred = identity %>%
  select(workerid,response,noun) %>%
  rename(response_identity = response) %>%
  right_join(prod,by=c("workerid","noun"))

#identity collapsed pred only 
ggplot(id_collapsed_pred %>% filter(response_identity != 'Confused'), aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_grid(noun~response_identity, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/ingroupoutgroup.png", height=30,width=20,limitsize=FALSE)

#identity collapsed pred only in terms of proportions - NOT QUITE RIGHT 
ggplot(id_collapsed_pred %>% filter(response_identity != 'Confused'), aes(x=class, fill=response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_grid(noun~response_identity, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=scales::percent) +
  labs(y="Proportion of Responses", x="class")
ggsave(file="../graphs/ingroupoutgroup_proportions.png",height=30,width=20,limitsize=FALSE)

#identity collapsed pred and noun 
ggplot(id_collapsed_pred %>% filter(response_identity != 'Confused'), aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_wrap(~response_identity, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/ingroupoutgroup_collapsed.png",height=20,width=20,limitsize=FALSE)

#identity collapsed pred and noun in terms of proportions rather than counts - NOT QUITE RIGHT
ggplot(id_collapsed_pred %>% filter(response_identity != 'Confused'), aes(x=class, fill=response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_wrap(~response_identity, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))+
  scale_y_continuous(labels=scales::percent) +
  labs(y="Proportion of Responses", x="class") 
ggsave(file="../graphs/ingroupoutgroup_collapsed_proportions.png",height=10,width=20,limitsize=FALSE)

###### PRODUCTION X LIKEABILITY 3 BINS#######

like_collapsed_pred = likeability %>%
  select(workerid,response_3bins,noun) %>%
  right_join(prod,by=c("workerid","noun"))

#likabiity 3 bins collapsed by pred, not noun
ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_grid(noun~response_3bins, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability3bins.png",height=20,width=20,limitsize=FALSE)

#likabiity 3 bins collapsed by pred, not noun PROPORTIONS
ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_grid(noun~response_3bins, scales="free_y") +
  scale_y_continuous(labels=scales::percent) +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability3bins_proportions.png",height=30,width=20,limitsize=FALSE)

#likability 3 bins collapsed pred and noun 
ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_wrap(~response_3bins, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability3bins_collapsed.png",height=10,width=20,limitsize=FALSE)

#likability 3 bins collapsed pred and noun proportions 
ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_wrap(~response_3bins, scales="free_y") +
  scale_y_continuous(labels=scales::percent) +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability3bins_collapsed_proportions.png",height=10,width=20,limitsize=FALSE)

###### PRODUCTION X LIKEABILITY 2 BINS#######

like_collapsed_pred = likeability %>%
  select(workerid,response_2bins,noun) %>%
  right_join(prod,by=c("workerid","noun"))

#likabiity 2 bins collapsed by pred, not noun
ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_grid(noun~response_2bins, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability2bins.png",height=20,width=20,limitsize=FALSE)

#likabiity 2 bins collapsed by pred, not noun PROPORTIONS
ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_grid(noun~response_2bins, scales="free_y") +
  scale_y_continuous(labels=scales::percent) +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability2bins_proportions.png",height=30,width=20,limitsize=FALSE)

#likability 2 bins collapsed pred and noun 
ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_wrap(~response_2bins, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability2bins_collapsed.png",height=10,width=20,limitsize=FALSE)

#likability 3 bins collapsed pred and noun proportions 
ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_wrap(~response_2bins, scales="free_y") +
  scale_y_continuous(labels=scales::percent) +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability2bins_collapsed_proportions.png",height=10,width=20,limitsize=FALSE)

#######DEMOCRATS LIKEABILITY ##########

#getting responses to questions about Democrats 
prod_pred = production %>% 
  filter(noun == 'Democrats') %>%
  select(workerid,noun,response,predicate,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

prod_pred$noun <- gsub('Black lives', 'Black people', prod_pred$noun)

#joining responses to questions about men with info about whether they identify as a man  

like_collapsed_pred_prod = likeability %>%
  select(workerid,response_2bins,noun) %>%
  right_join(prod_pred,by=c("workerid","noun"))

#Housekeeping for per-predicate plots: ordering in terms of predicate valence (done manually)#
like_collapsed_pred_prod$predicate2 = factor(like_collapsed_pred_prod$predicate, levels=c('competent','generous','honest','kind','smart','strong','incompetent','lie','rude','sexist','unintelligent','weak','eat','sleep','breathe','walk'))

ggplot(like_collapsed_pred_prod, aes(x=response_2bins, fill = response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_wrap(~predicate2, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/democrats_likability_predicates_2bins.png",height=20,width=20,limitsize=FALSE)

########## REPUBLICANS LIKEABILITY ##########

#getting responses to questions about Democrats 
prod_pred = production %>% 
  filter(noun == 'Republicans') %>%
  select(workerid,noun,response,predicate,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

prod_pred$noun <- gsub('Black lives', 'Black people', prod_pred$noun)

like_collapsed_pred_prod = likeability %>%
  select(workerid,response_2bins,noun) %>%
  right_join(prod_pred,by=c("workerid","noun"))

#Housekeeping for per-predicate plots: ordering in terms of predicate valence (done manually)#
like_collapsed_pred_prod$predicate2 = factor(like_collapsed_pred_prod$predicate, levels=c('competent','generous','honest','kind','smart','strong','incompetent','lie','rude','sexist','unintelligent','weak','eat','sleep','breathe','walk'))

ggplot(like_collapsed_pred_prod, aes(x=response_2bins, fill = response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_wrap(~predicate2, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/republicans_likability_predicates_2bins.png",height=20,width=20,limitsize=FALSE)

####### MEN LIKEABILITY ##########

#getting responses to questions about men 
prod_pred = production %>% 
  filter(noun == 'men') %>%
  select(workerid,noun,response,predicate,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

prod_pred$noun <- gsub('Black lives', 'Black people', prod_pred$noun)

#joining responses to questions about men with info about whether they identify as a man  

like_collapsed_pred_prod = likeability %>%
  select(workerid,response_2bins,noun) %>%
  right_join(prod_pred,by=c("workerid","noun"))

#Housekeeping for per-predicate plots: ordering in terms of predicate valence (done manually)#
like_collapsed_pred_prod$predicate2 = factor(like_collapsed_pred_prod$predicate, levels=c('competent','generous','honest','kind','smart','strong','incompetent','lie','rude','sexist','unintelligent','weak','eat','sleep','breathe','walk'))

ggplot(like_collapsed_pred_prod, aes(x=response_2bins, fill = response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_wrap(~predicate2, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/men_likability_predicates_2bins.png",height=20,width=20,limitsize=FALSE)

########## WOMEN LIKEABILITY ##########

#getting responses to questions about women 
prod_pred = production %>% 
  filter(noun == 'women') %>%
  select(workerid,noun,response,predicate,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

prod_pred$noun <- gsub('Black lives', 'Black people', prod_pred$noun)

like_collapsed_pred_prod = likeability %>%
  select(workerid,response_2bins,noun) %>%
  right_join(prod_pred,by=c("workerid","noun"))

#Housekeeping for per-predicate plots: ordering in terms of predicate valence (done manually)#
like_collapsed_pred_prod$predicate2 = factor(like_collapsed_pred_prod$predicate, levels=c('competent','generous','honest','kind','smart','strong','incompetent','lie','rude','sexist','unintelligent','weak','eat','sleep','breathe','walk'))

ggplot(like_collapsed_pred_prod, aes(x=response_2bins, fill = response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_wrap(~predicate2, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/women_likability_predicates_2bins.png",height=20,width=20,limitsize=FALSE)

########## DEMOCRATS IDENTITY ##########
prod_pred = production %>% 
  filter(noun == 'Democrats') %>%
  select(workerid,noun,response,predicate,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

prod_pred$noun <- gsub('Black lives', 'Black people', prod_pred$noun)

#joining responses to questions about men with info about whether they identify as a Democrat  

id_collapsed_pred_prod = identity %>%
  select(workerid,response,noun) %>%
  rename(response_identity = response) %>%
  right_join(prod_pred,by=c("workerid","noun"))

#Housekeeping for per-predicate plots: ordering in terms of predicate valence (done manually)#
id_collapsed_pred_prod$predicate2 = factor(id_collapsed_pred_prod$predicate, levels=c('competent','generous','honest','kind','smart','strong','incompetent','lie','rude','sexist','unintelligent','weak','eat','sleep','breathe','walk'))

ggplot(id_collapsed_pred_prod%>% filter(response_identity != 'Confused'), aes(x=response_identity, fill = response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_wrap(~predicate2, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/democrats_identity_predicates.png",height=20,width=20,limitsize=FALSE)

########## REPUBLICANS IDENTITY ##########
prod_pred = production %>% 
  filter(noun == 'Republicans') %>%
  select(workerid,noun,response,predicate,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

prod_pred$noun <- gsub('Black lives', 'Black people', prod_pred$noun)

#joining responses to questions about men with info about whether they identify as a Democrat  

id_collapsed_pred_prod = identity %>%
  select(workerid,response,noun) %>%
  rename(response_identity = response) %>%
  right_join(prod_pred,by=c("workerid","noun"))

#Housekeeping for per-predicate plots: ordering in terms of predicate valence (done manually)#
id_collapsed_pred_prod$predicate2 = factor(id_collapsed_pred_prod$predicate, levels=c('competent','generous','honest','kind','smart','strong','incompetent','lie','rude','sexist','unintelligent','weak','eat','sleep','breathe','walk'))

ggplot(id_collapsed_pred_prod%>% filter(response_identity != 'Confused'), aes(x=response_identity, fill = response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_wrap(~predicate2, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/republicans_identity_predicates.png",height=20,width=20,limitsize=FALSE)

########## MEN IDENTITY ##########
prod_pred = production %>% 
  filter(noun == 'men') %>%
  select(workerid,noun,response,predicate,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

prod_pred$noun <- gsub('Black lives', 'Black people', prod_pred$noun)

#joining responses to questions about men with info about whether they identify as a Democrat  

id_collapsed_pred_prod = identity %>%
  select(workerid,response,noun) %>%
  rename(response_identity = response) %>%
  right_join(prod_pred,by=c("workerid","noun"))

#Housekeeping for per-predicate plots: ordering in terms of predicate valence (done manually)#
id_collapsed_pred_prod$predicate2 = factor(id_collapsed_pred_prod$predicate, levels=c('competent','generous','honest','kind','smart','strong','incompetent','lie','rude','sexist','unintelligent','weak','eat','sleep','breathe','walk'))

ggplot(id_collapsed_pred_prod%>% filter(response_identity != 'Confused'), aes(x=response_identity, fill = response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_wrap(~predicate2, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/men_identity_predicates.png",height=20,width=20,limitsize=FALSE)

########## WOMEN IDENTITY ##########
prod_pred = production %>% 
  filter(noun == 'women') %>%
  select(workerid,noun,response,predicate,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

prod_pred$noun <- gsub('Black lives', 'Black people', prod_pred$noun)

#joining responses to questions about men with info about whether they identify as a Democrat  

id_collapsed_pred_prod = identity %>%
  select(workerid,response,noun) %>%
  rename(response_identity = response) %>%
  right_join(prod_pred,by=c("workerid","noun"))

#Housekeeping for per-predicate plots: ordering in terms of predicate valence (done manually)#
id_collapsed_pred_prod$predicate2 = factor(id_collapsed_pred_prod$predicate, levels=c('competent','generous','honest','kind','smart','strong','incompetent','lie','rude','sexist','unintelligent','weak','eat','sleep','breathe','walk'))

ggplot(id_collapsed_pred_prod%>% filter(response_identity != 'Confused'), aes(x=response_identity, fill = response_prod)) +
  geom_bar(stat="count",position="fill") +
  facet_wrap(~predicate2, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/women_identity_predicates.png",height=20,width=20,limitsize=FALSE)
