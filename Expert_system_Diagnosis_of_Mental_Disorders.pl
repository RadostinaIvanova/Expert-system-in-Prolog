diagnose :- 
 write('This is an expert system for dignosis of mental disorders.'), nl,
 write('There are several questions you need to answer for dignosis of mental disorders.'), nl, nl,
 disorder(X),
 write('Condition was diagnosed as '), 
 write(X),
 write('.').
diagnose :- 
    write('The diagnose was not found.').
 

%The question predicate will have to determine from the user 
%whether or not a given attribute-value pair is true
question(Attribute, Value):-
 retract(yes, Attribute, Value), !.
question(Attribute, Value):-
 retract(_, Attribute, Value),  !, fail.
question(Attribute, Value):-
 write('Is the '),
 write(Attribute),
 write(' - '),
 write(Value),
 write('?'),
 read(Y), 
 asserta(retract(Y, Attribute, Value)), 
 Y == yes.

%question with additional argument which contains
%a list of possible values for the attribute. 
questionWithPossibilities(Attribute, Value, Possibilities) :-
 write('What is the patient`s '), write(Attribute), write('?'), nl,
 write(Possibilities), nl,
 read(X),
 check_val(X, Attribute, Value, Possibilities),
 asserta( retract(yes, Attribute, X) ),
 X == Value.

check_val(X, _, _, Possibilities) :-  member(X, Possibilities),
 !.
check_val(X, Attribute, Value, Possibilities) :-
 write(X), write(' is not a legal value, try again.'), nl,
 questionWithPossibilities(Attribute, Value, Possibilities). 

%retract equips this system with a memory that remembers the facts that are already
%known because they were already entered by the user at some point during the interaction.
:- dynamic(retract/3).

%. The program needs to be modified to specify which attributes are askable
food_amount(X) :- question(food_amount,X).
symptom(X) :- question(symptom,X).
mentality(X) :- question(mentality,X).
cause(X) :- question(cause, X).
indication(X) :- question(indication,X).
social_skill(X) :- question(social_skill,X).
condition(X) :- question(condition, X).
consequence(X) :- question(consquence,X).
specialty(X) :- question(specialty,X).
face_features(X) :- question(face_features,X).
ears_features(X) :- question(ears_features,X).
brain_function(X) :- question(brain_function,X).
perceptions(X) :- question(perceptions, X).
behavior(X) :- questionWithPossibilities(behavior, X, [repetitive_and_restricted, narcissistic, aggresive]).  


disorder(anorexia_nervosa) :- type(eating_disorder),
    			      consequence(low_weight),
    			      food_amount(food_restriction).

disorder(bulimia_nervosa) :- type(eating_disorder),
    			     consequence(purging),
    	        	     food_amount(binge_eating).

disorder(asperger_syndrome) :- type(neurodevelopmental_disorder), 
   			       specialty(psychiatry),
    			       social_skill(low), 
    			       behavior(repetitive_and_restricted).

disorder(dyslexia) :- type(neurodevelopmental_disorder), 
    		      social_skill(normal), 
    		      perceptions(low),
    		      symptom(trouble_reading).

disorder(autism) :- type(neurodevelopmental_disorder), 
    		    social_skill(low), 
    		    symptom(impaired_communication).
    						   

disorder(tourettes_syndrome) :- type(neurodevelopmental_disorder), 
    			        social_skill(normal), 
   				specialty(neurology),
    				symptom(motor_tics).
	
disorder(bipolar_disorder) :- type(psychotic_disorder),
    			      indication(elevated_moods).

disorder(schizophrenia) :- type(psychotic_disorder),
    			   indication(hallucinations).

disorder(down_syndrome) :- type(genetic_disorder),
    			   symptom(delayed_physical_growth),
    			   face_features(long_and_narrow),
    			   ears_features(large),
    			   brain_function(intellectual_disability).

disorder(fragile_X_syndrome) :- type(genetic_disorder),
     				face_features(small_chin_and_slanted_eyes),
   				brain_function(intellectual_disability).
    
    
type(eating_disorder) :- symptom(abnormal_eating_habits),
    			 mentality(strong_desire_to_be_thin).

type(neurodevelopmental_disorder) :-  condition(affected_nervous_system), 
    			     	      brain_function(abnormal),
    				      cause(genetic_and_enviromental).

type(psychotic_disorder) :- symptom(false_beliefs),
    			    mentality(manic_depressive),
    			    cause(genetic_and_enviromental).

type(genetic_disorder) :- cause(abnormalities_in_genome).




