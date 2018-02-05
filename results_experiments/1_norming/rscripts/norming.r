library(tidyverse)
library(forcats)

theme_set(theme_bw(18))
source("helpers.r")

d = read.table(file="../data/data.csv",sep=",", header=T)
head(d)
nrow(d)
summary(d)
d$Trial = d$slide_number - 2
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
  stat_count()

ggplot(d, aes(enjoyment)) +
  stat_count()

# compute means
means = d %>%
  group_by(predicate, predicateclass) %>%
  summarize(Mean=mean(response),CILow=ci.low(response),CIHigh=ci.high(response)) %>%
  ungroup() %>%
  mutate(YMin=Mean-CILow,YMax=Mean+CIHigh) %>%
  mutate(Predicate = fct_reorder(predicate,Mean))

ggplot(means, aes(x=Predicate,y=Mean)) +
  geom_bar(stat="identity") +
  geom_errorbar(aes(ymin=YMin,ymax=YMax),width=.25) +
  facet_wrap(~predicateclass,scales="free_x") +
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1))
ggsave("../graphs/means.pdf",height=5,width=10)







