library(tidyverse)
library(forcats)
library(stringr)
library(ggplot2)

theme_set(theme_bw(18))
source("helpers.r")

d = read.table(file="../data/blm.csv",sep=",", header=T)
d = as.data.frame(lapply(d, function(x) {gsub('\"',"",x)}))
head(d)
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

id_collapsed_pred = identity %>%
  select(workerid,response,noun) %>%
  rename(response_identity = response) %>%
  right_join(prod,by=c("workerid","noun"))


<<<<<<< HEAD
#In/Out Group Plots: Production response collapsed by predicate per noun
ggplot(id_collapsed_pred %>% filter(response_identity != 'Confused'), aes(x=class, fill=response_prod)) +
=======
#######PLOTS: PRODUCTION RESPONSE COLLAPSED BY PREDICATE PER NOUN ############

#out-group
ggplot(id_collapsed_pred %>% filter(response_identity != "Yes" & response_identity != 'Confused'), aes(x=class, fill=response_prod)) +
>>>>>>> 5ec84c52d84e62dbfa8b6d7fcb03271e697cb4b1
  geom_histogram(stat="count",position="dodge") +
  facet_grid(noun~response_identity, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/ingroupoutgroup.pdf", height = 20)

#in-group
ggplot(id_collapsed_pred %>% filter(response_identity != "No" & response_identity != 'Confused'), aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_wrap(~noun) +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))

#Production merged with identity collapsed by pred and noun 
prod_collapsed = production %>%
  select(workerid,response,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

id_collapsed_pred_noun = identity %>%
  select(workerid,response) %>%
  mutate(response_identity = response) %>%
  left_join(prod_collapsed,by=c("workerid"))

ggplot(id_collapsed_pred %>% filter(response_identity != 'Confused'), aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_wrap(~response_identity, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/ingroupoutgroup_collapsed.pdf")

###### PLOTS: IDENTITY X PRODUCTION COLLAPSED BY PREDICATE *AND* NOUN #################

#outgroup
ggplot(id_collapsed_pred_noun %>%filter(response_identity != "Yes" & response_identity != 'Confused'), aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))

<<<<<<< HEAD
#Likeability2bins Plots: Production response collapsed by predicate per noun

like_collapsed_pred = likeability %>%
  select(workerid,response_2bins,noun) %>%
  right_join(prod,by=c("workerid","noun"))

ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_grid(noun~response_2bins, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability2bins.pdf", height = 20)

#Production merged with identity2bins collapsed by pred and noun 

prod_collapsed = production %>%
  select(workerid,response,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

like_collapsed_pred_noun = likeability %>%
  select(workerid,response_2bins) %>%
  left_join(prod_collapsed,by=c("workerid"))

ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_wrap(~response_2bins, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability2bins_collapsed.pdf")

ggplot(like_collapsed_pred_noun, aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))

#Likeability3bins Plots: Production response collapsed by predicate per noun
=======
#ingroup
ggplot(id_collapsed_pred_noun %>%filter(response_identity != "No" & response_identity != 'Confused'), aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))

###### PRODUCTION X LIKEABILITY COLLAPSED PRED AND NOUN#######

like_collapsed_pred_noun = likeability %>%
  select(workerid,response) %>%
  mutate(response_likeability = response) %>%
  left_join(prod_collapsed,by=c("workerid"))

###### PRODUCTION X LIKEABILITY COLLAPSED PRED AND NOUN#######

#didn't like - .33 and down
ggplot(like_collapsed_pred_noun %>%filter(response_likeability < .33), aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))

#neutral feeling - .33 and .66 
ggplot(like_collapsed_pred_noun %>%filter(response_likeability >= .33 & response_likeability <= .66), aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))

#did like - .66 and up 
ggplot(like_collapsed_pred_noun %>%filter(response_likeability > .66), aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
>>>>>>> 5ec84c52d84e62dbfa8b6d7fcb03271e697cb4b1

like_collapsed_pred = likeability %>%
  select(workerid,response_3bins,noun) %>%
  right_join(prod,by=c("workerid","noun"))

ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_grid(noun~response_3bins, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability3bins.pdf", height = 20)

#Production merged with identity3bins collapsed by pred and noun 

prod_collapsed = production %>%
  select(workerid,response,class) %>%
  mutate(response_prod = response) %>%
  select(-response)

like_collapsed_pred_noun = likeability %>%
  select(workerid,response_3bins) %>%
  left_join(prod_collapsed,by=c("workerid"))

ggplot(like_collapsed_pred, aes(x=class, fill=response_prod)) +
  geom_histogram(stat="count",position="dodge") +
  facet_wrap(~response_3bins, scales="free_y") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave(file="../graphs/likeability3bins_collapsed.pdf")





