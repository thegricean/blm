# Black lives matter: The effect of QUD manipulation on exhaustivity inference #

There is evidence to show that by using cover stories, listener interpretation of QUD can be implicitly manipulated, leading to differing pragmatic inferences. Degen & Goodman (2014) investigated the effect of QUD and contextually available set size on scalar implicatures using the sentence verification paradigm. They found that participants were more likely to draw a scalar implicature when they were presented with a cover story that primed a scalar implicature. In this paper, we explore an application of such a methodology to exhaustivity inference, positing that systematic manipulation of priming cover stories can influence a listener to draw an exhaustivity inference or not.

We will present results from an experiment testing our primary hypotheses that the misunderstanding of "Black lives matter" is an incorrectly and strongly drawn exhaustivity inference affected by the contextually evoked QUD, which we will manipulate by presenting different cover stories to listeners and asking them to answer questions about an utterance related to the cover story. 

## Method ##

###Participants###
We recruited 400 participants through Amazon.com's Mechanical Turk crowdsourcing service. Participants were compensated for their time. 

###Design and Methods###

Example cover story: Michelle is a software developer at Apple. She works on the Apple Music group, which is composed of many subteams. Each of the subteams in her larger group is composed of either all men or all women. The other day at her team's weekly meeting, her boss unveiled that he would be choosing a subteam to work on a new project, and that he would choose a subteam based on their high level of competence. She raised her hand to speak in the meeting and said, "Women are competent."

Man and woman subteams - competence based on group versus on individual

When the question is "Are women competent?" we don't care about whether men are competent or not 

"Who is competent" : boss is deciding whether to choose a team of all men, or of all women 
"Are women competent" : boss has chosen a team of men and needs to additionally recruit a new team of men or women 

Utterance: Women are competent

Question: Who does Michelle believe to be competent? 
- Men and not women 
- Women and not men 
- Women and men 
- Neither women nor men

How X does the speaker think the following Y are? 
- Men (and slider from very incompetent to very competent)
- Women (and slider)

Concerns: adding different predicates, different groups (keep men/women, Dems/Reps)

Incompetence: laying people off 

#analysis from last quarter#
log reg predicting yes vs. 
response (yes versus not yes) as a function of membership/likability interacting with predicate valence
Mixed effects model accounts for individual subject and item variability 

Random effects assumption: probability/error (normally distributed with a mean of zero) of deviation from the linear smoother 

3 positive and 3 negative predicates crossed with 6 categories 

Exhaustivity inference: Recognizable by virtue of men being less competent under the Who? relative to the Are? conditions 

Can measure a baseline by presenting the context with no utterance (between subjects)

##Contexts## 
Democrats/Republicans, incompetent/competent, honest/dishonest, smart/unintelligent

To do: 
- incompetent
- weak
- strong
- smart
- unintelligent

Done: 
- competent 

2 questions: 
1) Who is Y? (between groups X and Z for predicate Y)
2) Are X Y? 

###Competent###
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new, highly classified project, and that he would choose the committee based on their high level of competence. She raised her hand to speak in the meeting and said, "Democrats are competent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to work on a new, highly classified project and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the basis of competence. Michelle raised her hand to speak in the meeting and said, "Democrats are competent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new, highly classified project, and that he would choose the committee based on their high level of competence. She raised her hand to speak in the meeting and said, "Republicans are competent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to work on a new, highly classified project and that he would be choosing another to join them. He also mentioned that the second committee would be chosen on the basis of compeqtence. Michelle raised her hand to speak in the meeting and said, "Republicans are competent."

####Incompetent####
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional policy training in coming weeks, and that he would choose the committee based on their incompetence as of late. She raised her hand to speak in the meeting and said, "Democrats are incompetent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to complete additional policy training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their incompetence as of late. Michelle raised her hand to speak in the meeting and said, "Democrats are incompetent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional policy training in coming weeks, and that he would choose the committee based on their incompetence as of late. She raised her hand to speak in the meeting and said, "Republicans are incompetent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to complete additional policy training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their incompetence as of late. Michelle raised her hand to speak in the meeting and said, "Republicans are incompetent."

###Smart###
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new, highly classified project, and that he would choose the committee based on their high level of intelligence. She raised her hand to speak in the meeting and said, "Democrats are smart."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to work on a new, highly classified project and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the basis of intelligence. Michelle raised her hand to speak in the meeting and said, "Democrats are smart."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new, highly classified project, and that he would choose the committee based on their high level of intelligence. She raised her hand to speak in the meeting and said, "Republicans are smart."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to work on a new, highly classified project and that he would be choosing another to join them. He also mentioned that the second committee would be chosen on the basis of intelligence. Michelle raised her hand to speak in the meeting and said, "Republicans are smart."

####Unintelligent####
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional policy training in coming weeks, and that he would choose the committee based on their lack of intelligence as of late. She raised her hand to speak in the meeting and said, "Democrats are unintelligent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to complete additional policy training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their lack of intelligence as of late. Michelle raised her hand to speak in the meeting and said, "Democrats are unintelligent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional policy training in coming weeks, and that he would choose the committee based on their lack of intelligence as of late. She raised her hand to speak in the meeting and said, "Republicans are unintelligent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to complete additional policy training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their lack of intelligence as of late. Michelle raised her hand to speak in the meeting and said, "Republicans are unintelligent."

###Honest###
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new transparency initiative, and that he would choose the committee based on their high level of honesty in their careers as policymakers. She raised her hand to speak in the meeting and said, "Democrats are honest."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to work on a new transparency initiative and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the basis of honesty in their careers as policymakers. Michelle raised her hand to speak in the meeting and said, "Democrats are honest."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new transparency initiative, and that he would choose the committee based on their high level of honesty in their careers as policymakers. She raised her hand to speak in the meeting and said, "Republicans are honest."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to work on a new transparency initiative and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the basis of honesty in their careers as policymakers. Michelle raised her hand to speak in the meeting and said, "Republicans are honest."

####Unintelligent####
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional honesty training in coming weeks, and that he would choose the committee based on their propensity to lie. She raised her hand to speak in the meeting and said, "Democrats lie."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to complete additional honesty training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their demonstrated penchant for lying. Michelle raised her hand to speak in the meeting and said, "Democrats lie."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional honesty training in coming weeks, and that he would choose the committee based on their propensity to lie. She raised her hand to speak in the meeting and said, "Republicans lie."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to complete additional honesty training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their demonstrated penchant for lying. Michelle raised her hand to speak in the meeting and said, "Republicans lie."










