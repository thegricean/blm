var predicates = [
        {"Predicate":"be smart", "PredicateClass":"Positive"},
        {"Predicate":"be generous", "PredicateClass":"Positive"},
        {"Predicate":"be kind", "PredicateClass":"Positive"},
        {"Predicate":"be funny", "PredicateClass":"Positive"},
        {"Predicate":"be cooperative", "PredicateClass":"Positive"},
        {"Predicate":"be talented", "PredicateClass":"Positive"},
        {"Predicate":"be competent", "PredicateClass":"Positive"},
        {"Predicate":"be strong", "PredicateClass":"Positive"},
        {"Predicate":"be tolerant", "PredicateClass":"Positive"},
        {"Predicate":"be nice", "PredicateClass":"Positive"},
        {"Predicate":"solve problems", "PredicateClass":"Positive"},
        {"Predicate":"be honest", "PredicateClass":"Positive"},
        {"Predicate":"matter", "PredicateClass":"Positive"},
        {"Predicate":"be unintelligent", "PredicateClass":"Negative"},
        {"Predicate":"be selfish", "PredicateClass":"Negative"},
        {"Predicate":"be dirty", "PredicateClass":"Negative"},
        {"Predicate":"be incompetent", "PredicateClass":"Negative"},
        {"Predicate":"be loud", "PredicateClass":"Negative"},
        {"Predicate":"be rude", "PredicateClass":"Negative"},
        {"Predicate":"be intolerant", "PredicateClass":"Negative"},
        {"Predicate":"be weak", "PredicateClass":"Negative"},
        {"Predicate":"be sexist", "PredicateClass":"Negative"},
        {"Predicate":"be condescending", "PredicateClass":"Negative"},
        {"Predicate":"cheat", "PredicateClass":"Negative"},
        {"Predicate":"lie", "PredicateClass":"Negative"},
        {"Predicate":"swear", "PredicateClass":"Negative"},
        {"Predicate":"lay eggs", "PredicateClass":"Neutral"},
        {"Predicate":"fly", "PredicateClass":"Neutral"},
        {"Predicate":"burrow", "PredicateClass":"Neutral"},
        {"Predicate":"eat carrots", "PredicateClass":"Neutral"},
        {"Predicate":"be a mammal", "PredicateClass":"Neutral"},
        {"Predicate":"eat", "PredicateClass":"Neutral"},
        {"Predicate":"sleep", "PredicateClass":"Neutral"},
        {"Predicate":"walk", "PredicateClass":"Neutral"},
        {"Predicate":"swim", "PredicateClass":"Neutral"},
        {"Predicate":"breathe", "PredicateClass":"Neutral"},
        {"Predicate":"talk", "PredicateClass":"Neutral"}
];

var stimuli =  _.shuffle(makeStims());

function makeStims() {
	stims = [];

	for (var i=0; i<predicates.length; i++) {
		predicate = predicates[i];
		stims.push(
			{			
				"Predicate":predicate.Predicate,
				"PredicateClass":predicate.PredicateClass
			}
			);
		}
		
	return stims;
	
}
