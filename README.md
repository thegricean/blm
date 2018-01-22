# PREDICATES TO NORM 
Positive: 
matters
cares
be generous
be kind
be helpful
be funny
succeed
impress
pray
recycle
create
solve problems
motivate others
lead
love
innovate
thrive
cooperate
be talented
be pretty
Are Beautiful
Are Smart
Are Nice
Are Capable 
Are Courteous
Are Talented 
Are Strong
Are Lively
Are Funny

Negative:
be rude
be loud
lie
cheat
steal
cry
disappoint others
be arrogant
be condescending
swear
kill
bully
be spoiled
slam doors
bite
be intolerant
be unkind
quit
get divorced
Are Loud
Are Selfish
Are Flawed
Are Ugly
Are Dirty
Are Weak 
Are Dull
Are Unintelligent
Are Incompetent

Neutral:
lay eggs
fly
walk
sleep
swim
run
burn
cook
stretch
camouflage 
burrow
eat carrots
Went Home
Drink Water
Eat Food
Roar
Go to the Bathroom
Jump
Can Sleep
Can Blink
Can Wave

Categories:
Women
Men
Millenials
Baby Boomers
Europeans
Americans
Republicans
Democrats
(Black Lives Matter and Blue Lives Matter)
(Robins and Lions)

# Useful links to articles

1. On asymmetries in people who do and don't support Trump's perceptions in how white vs black people (and Christians vs non-Christians) are treated in the US. Also includes info on Democrats vs independents vs Republicans.

http://www.salon.com/2017/02/12/trumps-supporters-believe-a-false-narrative-of-white-victimhood-and-the-data-proves-it/

"When you’re accustomed to privilege, equality feels like discrimination." --> modelable!

"The conservative, to be sure, speaks for a special type of victim: one who has lost something of value, as opposed to the wretched of the earth, whose chief complaint is that they never had anything to lose."

Also includes a great list of potential domains for stimuli (includes links to facts on each issue):
"Conservatives must create an ideological bubble in which crime is out of control (instead of hovering near historic lows), the rate of abortion is rising (instead of falling), refugees are committing terrorist attacks en masse (they aren’t at all) and immigrants are taking jobs (it’s the capitalists), all while the government is funneling money to undeserving black people (black people receive government support in accordance with their share of the population, despite making up a disproportionately large share of the poor). Conservatives, and many in the general public, believe that Muslims and immigrants (both legal and unauthorized) make up a dramatically larger share of the population than they actually do."

2. On frames, and how hashtags are used to mark participation, assert individual and group identity

STEWART, L., ARIF, A., NIED, A. C., SPIRO, E. S., & STARBIRD, K. (2017). Drawing the Lines of Contention: Networked Frame Contests Within# BlackLivesMatter Discourse.

http://faculty.washington.edu/kstarbi/Stewart_Starbird_Drawing_the_Lines_of_Contention-final.pdf


## Vaguely related tweets
"good tweet: "6.5% of men are rapists, .0035% of Refugees are terrorists, but #NotAllMen am I right? @realDonaldTrump"


# NOTES FROM PARIS WORKSHOP 3/29

- conflations:
	- of actual and normative state of the world (which lives matter vs. which lives ought to matter) --> solution? (Eric Acton, Benjamin Spector)
	- of listener and spekaer priors --> try the wonky world move (Eric Acton, Dan Lassiter, Paul Egre who talked about it in terms of presupposition accommodation)

- infer focus from utterance? Dan L.

- Women have babies; Not all women. Individual threat;face loss, somehting like that? as independent dimension to model. (A woman named Dana? who works on Relevance Theory)

- re-read Potts 2007 for dimensions of expressives (Eric Acton)


# LATEX MATH NOTATION FOR TALKS

M = \{<\textrm{b},\textrm{w}>, <\textrm{b},\neg \textrm{w}>, <\neg \textrm{b},\textrm{w}>, <\neg \textrm{b}, \neg \textrm{w}>\}


U = \{\textrm{Black lives matter},
      \textrm{All lives matter},
      \textrm{White lives matter},
      \textrm{No lives matter}\}

q : M \rightarrow A

P_{S_1}(u|m,q) \propto e^{\lambda \cdot (\ln P_{L_0}(q(m)|u))}      

P_{L_0}(q(m)|u) \propto \sum_{m'} \delta_{q(m')=q(m)} P_{L_0}(m'|u)

P_{L_1}(m|u,q) \propto P_{S_1}(u|m,q) \cdot P(m) \cdot  P(q) 

P_{L_1}(q|u) \propto P(q) \sum_m P(m)P_{S_1}(u|m,q)

P_{L_1}(m,q|u) \propto P_{S_1}(u|m,q) P(m) P(q)
