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

## Contexts ##
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

### Competent ###
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new, highly classified project, and that he would choose the committee based on their high level of competence. She raised her hand to speak in the meeting and said, "Democrats are competent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to work on a new, highly classified project and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the basis of competence. Michelle raised her hand to speak in the meeting and said, "Democrats are competent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new, highly classified project, and that he would choose the committee based on their high level of competence. She raised her hand to speak in the meeting and said, "Republicans are competent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to work on a new, highly classified project and that he would be choosing another to join them. He also mentioned that the second committee would be chosen on the basis of compeqtence. Michelle raised her hand to speak in the meeting and said, "Republicans are competent."

#### Incompetent ####
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional policy training in coming weeks, and that he would choose the committee based on their incompetence as of late. She raised her hand to speak in the meeting and said, "Democrats are incompetent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to complete additional policy training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their incompetence as of late. Michelle raised her hand to speak in the meeting and said, "Democrats are incompetent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional policy training in coming weeks, and that he would choose the committee based on their incompetence as of late. She raised her hand to speak in the meeting and said, "Republicans are incompetent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to complete additional policy training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their incompetence as of late. Michelle raised her hand to speak in the meeting and said, "Republicans are incompetent."

### Smart ###
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new, highly classified project, and that he would choose the committee based on their high level of intelligence. She raised her hand to speak in the meeting and said, "Democrats are smart."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to work on a new, highly classified project and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the basis of intelligence. Michelle raised her hand to speak in the meeting and said, "Democrats are smart."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new, highly classified project, and that he would choose the committee based on their high level of intelligence. She raised her hand to speak in the meeting and said, "Republicans are smart."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to work on a new, highly classified project and that he would be choosing another to join them. He also mentioned that the second committee would be chosen on the basis of intelligence. Michelle raised her hand to speak in the meeting and said, "Republicans are smart."

#### Unintelligent ####
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional policy training in coming weeks, and that he would choose the committee based on their lack of intelligence as of late. She raised her hand to speak in the meeting and said, "Democrats are unintelligent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to complete additional policy training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their lack of intelligence as of late. Michelle raised her hand to speak in the meeting and said, "Democrats are unintelligent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional policy training in coming weeks, and that he would choose the committee based on their lack of intelligence as of late. She raised her hand to speak in the meeting and said, "Republicans are unintelligent."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to complete additional policy training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their lack of intelligence as of late. Michelle raised her hand to speak in the meeting and said, "Republicans are unintelligent."

### Honest ###
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new transparency initiative, and that he would choose the committee based on their high level of honesty in their careers as policymakers. She raised her hand to speak in the meeting and said, "Democrats are honest."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to work on a new transparency initiative and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the basis of honesty in their careers as policymakers. Michelle raised her hand to speak in the meeting and said, "Democrats are honest."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to work on a new transparency initiative, and that he would choose the committee based on their high level of honesty in their careers as policymakers. She raised her hand to speak in the meeting and said, "Republicans are honest."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to work on a new transparency initiative and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the basis of honesty in their careers as policymakers. Michelle raised her hand to speak in the meeting and said, "Republicans are honest."

#### Lie ####
Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional honesty training in coming weeks, and that he would choose the committee based on their propensity to lie. She raised her hand to speak in the meeting and said, "Democrats lie."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Republican committee to complete additional honesty training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their demonstrated penchant for lying. Michelle raised her hand to speak in the meeting and said, "Democrats lie."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he would be choosing an existing legislative committee to complete additional honesty training in coming weeks, and that he would choose the committee based on their propensity to lie. She raised her hand to speak in the meeting and said, "Republicans lie."

Michelle is a senator from the state of Pennsylvania. She is a member of a number of different legislative committees. In the Senate, every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the Vice President (and head of the Senate) unveiled that he had chosen a Democratic committee to complete additional honesty training and that he would be choosing another to join them. He also reminded them that all committees would be chosen on the based on their demonstrated penchant for lying. Michelle raised her hand to speak in the meeting and said, "Republicans lie."


### Stimuli as of 4/30/2018 ###
Democrats/Republicans * incompetent/competent
Men/women * weak/strong
People in their 20's/People in their 50's * rude/polite
Europeans/Americans * smart/stupid 

### Design ### 
Each participant is randomly assigned, for each pair of nouns (e.g. men/women) to one quality and one QUD 
- Example: A participant is assigned Reps competent and Dems incompetent, former under Are? and latter under Who?

8 cover stories in total 

Comprehension question between cover story and critical sliders 

Probe prior beliefs after: "How competent do you think the following are?" (question: how many sliders per slide? 2 per slide to start)


#### Competent ####
Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he would be choosing an existing legislative committee to work on a new project based on their high level of competence. She raised her hand to speak in the meeting and said, "Democrats are competent"

Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he would be choosing an existing legislative committee to work on a new project based on their high level of competence. She raised her hand to speak in the meeting and said, "Republicans are competent"

Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he he had chosen a Democratic committee to work on a new, highly classified project and that he would be choosing another to join them. He then reminded them that all committees on the project would be chosen based on their high level of competence. She raised her hand to speak in the meeting and said, "Republicans are competent"

Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he he had chosen a Republican committee to work on a new, highly classified project and that he would be choosing another to join them. He then reminded them that all committees on the project would be chosen based on their high level of competence. She raised her hand to speak in the meeting and said, "Democrats are competent"

####Incompetent####
Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he would be choosing an existing legislative committee to complete additional policy training based on their demonstrated incompetence. She raised her hand to speak in the meeting and said, "Democrats are incompetent"

Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he would be choosing an existing legislative committee to complete additional policy training based on their demonstrated incompetence. She raised her hand to speak in the meeting and said, "Republicans are incompetent"

Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he he had chosen a Democratic committee to complete additional policy training and that he would be choosing another to join them. He then reminded them that all committees chosen to do the additional training would be chosen based on their demonstrated incompetence. She raised her hand to speak in the meeting and said, "Republicans are incompetent"

Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he he had chosen a Republican committee to complete additional policy training and that he would be choosing another to join them. He then reminded them that all committees chosen to do the additional training would be chosen based on their demonstrated incompetence. She raised her hand to speak in the meeting and said, "Democrats are incompetent"

#### Rational #### (Question: how to deal with confounds of cover story subject gender?, different senses of a word)
Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at the firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing an existing litigation team to work on a new high-profile case based on their high level of strength in the courtroom. Alex raised a hand to speak in the meeting and said, "Women are strong"

Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at her firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing an existing litigation team to work on a new high-profile case based on their high level of strength in the courtroom. She raised her hand to speak in the meeting and said, "Men are strong"

Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at her firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing two existing litigation teams to work on a new high-profile case based on their high level of strength in the courtroom, and that he had already chosen one team of men. She raised her hand to speak in the meeting and said, "Women are strong"

Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at her firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing two existing litigation teams to work on a new high-profile case based on their high level of strength in the courtroom, and that he had already chosen one team of women. She raised her hand to speak in the meeting and said, "Men are strong"

#### Emotional ####
Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at her firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing an existing litigation team to complete additional mediation training based on their demonstrated weakness in the courtroom. She raised her hand to speak in the meeting and said, "Women are weak"

Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at her firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing an existing litigation team to complete additional mediation training based on their rationality in the courtroom. She raised her hand to speak in the meeting and said, "Men are weak"

Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at her firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing two existing litigation teams to complete additional mediation training based on their demonstrated weakness in the courtroom, and that he had already chosen one team of men. She raised her hand to speak in the meeting and said, "Women are weak"

Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at her firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing two existing litigation teams to complete additional mediation training based on their demonstrated weakness in the courtroom, and that he had already chosen one team of women. She raised her hand to speak in the meeting and said, "Men are weak"

####Polite####
Alex is a waitress at a five-star restaurant and is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing an existing hospitality team to work a high-profile, celebrity charity dinner event based on their high level of politeness. She raised her hand to speak in the meeting and said, "People in their 20's are polite"

Alex is a waitress at a five-star restaurant is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing an existing hospitality team to work a high-profile, celebrity charity dinner event based on their high level of politeness. She raised her hand to speak in the meeting and said, "People in their 50's are polite"

Alex is a waitress at a five-star restaurant is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing two existing hospitality teams to work a high-profile, celebrity charity dinner event based on their high level of politeness, and that he had already chosen one team of people in their 50's. She raised her hand to speak in the meeting and said, "People in their 20's are polite"

Alex is a waitress at a five-star restaurant is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing two existing hospitality teams to work a high-profile, celebrity charity dinner event based on their politeness, and that he had already chosen one team of people in their 20's. She raised her hand to speak in the meeting and said, "People in their 50's are polite"

####Rude####
Alex is a waitress at a five-star restaurant is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing an existing hospitality team to complete additional waitstaff training based on their demonstrated rudeness. She raised her hand to speak in the meeting and said, "People in their 20's are rude"

Alex is a waitress at a five-star restaurant is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing an existing hospitality team to complete additional waitstaff training based on their demonstrated rudeness. She raised her hand to speak in the meeting and said, "People in their 50's are rude"

Alex is a waitress at a five-star restaurant is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing two existing hospitality teams to complete additional waitstaff training based on their demonstrated rudeness, and that he had already chosen one team of people in their 50's. She raised her hand to speak in the meeting and said, "People in their 20's are rude"

Alex is a waitress at a five-star restaurant is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing two existing hospitality teams to complete additional waitstaff training based on their demonstrated rudeness, and that he had already chosen one team of people in their 20's. She raised her hand to speak in the meeting and said, "People in their 50's are rude"

####Smart####

Change to high school students being chosen for a scholarship

Alex is a professor at a large university and is a member of many academic committees within her department. Every academic committee in her department is composed of either all American or all European professors. The other day in an all-hands meeting, the head of the department unveiled that he would be choosing an existing academic committee to receive a prestigious fellowship based on their high level of intelligence. She raised her hand to speak in the meeting and said, "Americans are smart"

Alex is a professor at a large university and is a member of many academic committees within her department. Every academic committee in her department is composed of either all American or all European professors. The other day in an all-hands meeting, the head of the department unveiled that he would be choosing an existing academic committee to receive a prestigious fellowship based on their high level of intelligence. She raised her hand to speak in the meeting and said, "Europeans are smart"

Alex is a professor at a large university and is a member of many academic committees within her department. Every academic committee in her department is composed of either all American or all European professors. The other day in an all-hands meeting, the head of the department unveiled that he would be choosing two existing academic committees to receive a prestigious fellowship based on their high level of intelligence, and that he'd already chosen a committee of Europeans. She raised her hand to speak in the meeting and said, "Americans are smart"

Alex is a professor at a large university and is a member of many academic committees within her department. Every academic committee in her department is composed of either all American or all European professors. The other day in an all-hands meeting, the head of the department unveiled that he would be choosing two existing academic committees to receive a prestigious fellowship based on their high level of intelligence, and that he'd already chosen a committee of Americans. She raised her hand to speak in the meeting and said, "Europeans are smart"

####Stupid####
Alex is a professor at a large university and is a member of many academic committees within her department. Every academic committee in her department is composed of either all American or all European professors. The other day in an all-hands meeting, the head of the department unveiled that he would be choosing an existing academic committee to redo every study they've run in the last year based on their intelligence. She raised her hand to speak in the meeting and said, "Americans are stupid"

Alex is a professor at a large university and is a member of many academic committees within her department. Every academic committee in her department is composed of either all American or all European professors. The other day in an all-hands meeting, the head of the department unveiled that he would be choosing an existing academic committee to redo every study they've run in the last year based on their demonstrated stupidity in conducting research. She raised her hand to speak in the meeting and said, "Europeans are stupid"

Alex is a professor at a large university and is a member of many academic committees within her department. Every academic committee in her department is composed of either all American or all European professors. The other day in an all-hands meeting, the head of the department unveiled that he would be choosing two existing academic committees to redo every study they've run in the last year based on their demonstrated stupidity in conducting research, and that he'd already chosen a committee of Europeans. She raised her hand to speak in the meeting and said, "Americans are stupid"

Alex is a professor at a large university and is a member of many academic committees within her department. Every academic committee in her department is composed of either all American or all European professors. The other day in an all-hands meeting, the head of the department unveiled that he would be choosing two existing academic committees to redo every study they've run in the last year based on their demonstrated stupidity in conducting research, and that he'd already chosen a committee of Americans. She raised her hand to speak in the meeting and said, "Europeans are stupid"

### Notes 5/1/2018 ####
leave out negatively valenced predicates
between subjects design (2 QUD x 2 categories x 4 predicates)
Mixed effects linear regression (predicting rating from qud, category target/other main effects and interactions)
Random intercepts for subjects and for items where items are combinations of a category and a predicate
Random slopes for both subjects and items for QUD and category

###Stimuli as of 5/1/2018####
Predicates (positive only): competent, polite, rational, smart 

#### Competent ####
Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he would be choosing an existing legislative committee to work on a new project based on their competence. She raised her hand to speak in the meeting and said, "Democrats are competent"

Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he would be choosing an existing legislative committee to work on a new project based on their competence. She raised her hand to speak in the meeting and said, "Republicans are competent"

Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he he had chosen a Democratic committee to work on a new, highly classified project and that he would be choosing another to join them. He then reminded them that all committees on the project would be chosen based on their competence. She raised her hand to speak in the meeting and said, "Republicans are competent"

Michelle is a senator of a major political party and is a member of many legislative committees. Every legislative committee is composed of either all Democrats or all Republicans. The other day in a Senate session, the head of the Senate unveiled that he he had chosen a Republican committee to work on a new, highly classified project and that he would be choosing another to join them. He then reminded them that all committees on the project would be chosen based on their competence. She raised her hand to speak in the meeting and said, "Democrats are competent"

####Polite####
Alex is a waitress at a five-star restaurant and is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing an existing hospitality team to work a high-profile, celebrity charity dinner event based on their politeness. She raised her hand to speak in the meeting and said, "People in their 20's are polite"

Alex is a waitress at a five-star restaurant is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing an existing hospitality team to work a high-profile, celebrity charity dinner event based on their politeness. She raised her hand to speak in the meeting and said, "People in their 50's are polite"

Alex is a waitress at a five-star restaurant is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing two existing hospitality teams to work a high-profile, celebrity charity dinner event based on their politeness, and that he had already chosen one team of people in their 50's. She raised her hand to speak in the meeting and said, "People in their 20's are polite"

Alex is a waitress at a five-star restaurant is a member of many hospitality teams within the larger waitstaff. Every hospitality team at the restaurant is composed of either all people in their 20's or all people in their 50's. The other day in an all-hands meeting before opening for the day, the owner of the restaurant unveiled that he would be choosing two existing hospitality teams to work a high-profile, celebrity charity dinner event based on their politeness, and that he had already chosen one team of people in their 20's. She raised her hand to speak in the meeting and said, "People in their 50's are polite"

#### Rational #### 
Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at her firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing an existing litigation team to work on a new high-profile case based on their rationality. Alex raised her hand to speak in the meeting and said, "Women are rational"

Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at her firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing an existing litigation team to work on a new high-profile case based on their rationality. She raised her hand to speak in the meeting and said, "Men are rational"

Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at her firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing two existing litigation teams to work on a new high-profile case based on their rationality, and that he had already chosen one team of men. She raised her hand to speak in the meeting and said, "Women are rational"

Alex is a lawyer at a major law firm and is a member of many litigation teams. Every litigation team at her firm is composed of either all men or all women. The other day in an all-hands meeting, one of the partners unveiled that he would be choosing two existing litigation teams to work on a new high-profile case based on their rationality, and that he had already chosen one team of women. She raised her hand to speak in the meeting and said, "Men are rational"

#### Smart ####
Alex is a student at an international high school and is a member of many study groups. Every study group in her school is composed of either all American or all European students. The other day in an all-school assembly, the principal unveiled that he would be choosing an existing study group to receive a prestigious scholarship based on their intelligence. She raised her hand to speak in the meeting and said, "Americans are smart"

Alex is a student at an international high school and is a member of many study groups. Every study group in her school is composed of either all American or all European students. The other day in an all-school assembly, the principal unveiled that he would be choosing an existing study group to receive a prestigious scholarship based on their intelligence. She raised her hand to speak in the meeting and said, "Europeans are smart"

Alex is a student at an international high school and is a member of many study groups. Every study group in her school is composed of either all American or all European students. The other day in an all-school assembly, the principal unveiled that he would be choosing two existing study groups to receive a prestigious scholarship based on their intelligence, and that he'd already chosen one group of Europeans. She raised her hand to speak in the meeting and said, "Americans are smart"

Alex is a student at an international high school and is a member of many study groups. Every study group in her school is composed of either all American or all European students. The other day in an all-school assembly, the principal unveiled that he would be choosing two existing study groups to receive a prestigious scholarship based on their high level of intelligence, and that he'd already chosen one group of Americans. She raised her hand to speak in the meeting and said, "Europeans are smart"

