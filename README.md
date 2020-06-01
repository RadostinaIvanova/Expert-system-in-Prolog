# Система, оснавана на знания, реализирана с Пролог

## 1.	Същност на решаваната задача
Експертната системата идентифицира дадено умствено заболяване или увреждане, използвайки правила и факти.
Идентификацията се осъществява чрез задаване на въпроси, на които потребителя може да отговоря с „да“ или „не“  или там, където се изисква, се дава пълен отговор 
като е дадено меню от възможни отговори.

## 2.	Структура и съдържание на решаваната задача
 


Експертната система индетифицира умствени заболявания(mental disorders). Възможните умствени заболявания са 10, които са класифицирани в 4 типа:
•	Eating disorder
•	Neurodevelopmental disorder
•	Psychotic disorder
•	Genetic disorder

Тип Eating disorder, отговаря на критериите
-	психика(mentality): силно желание да бъдеш слаб (strong desire to be thin)
-	симптом(symptom): абнормални(неправилни) хранителни навици (abnormal eating habits)

Тип Neurodevelopmental disorder, отговаря на критериите
-	състояние(condition): засегната нервна система (affected nervous system)
-	причина(cause): генетични заложби или влияние на средата (genetic and environmental)
-	функциониране на мозъка(brain function): абнормално (abnormal)

 Тип Psychotic disorder, отговаря на критериите
-	психика(mentality): маниакална и депресивна(manic and depressive)
-	симптом(symptom): вяра в неща,които не са реални (false beliefs) 
-	причина(cause): генетични залобни или влияние на средата(genetic and environmental)

Тип Genetic disorder, отговаря на критериите
-	причина(cause): аномалии в генома(abnormalities in genome)

### MENTAL DISORDERS
- Anorexia nervosa - type(eating disorder), consequence(low weight), food amount(food restriction).
- Bulimia Nervosa - type(eating disorder), consequence(purging), food amount(binge eating).
- Asperger syndrome - type(neurodevelopmental disorder), specialty(psychiatry), social skill(low), behavior(repetitive and restricted).
- Dyslexia - type(neurodevelopmental disorder),  specialty(psychiatry), social skill(low), behavior(repetitive and restricted).
- Autism - type(neurodevelopmental disorder), social skill(low), symptom(impaired communication).
- Tourette’s syndrome - type(neurodevelopmental disorder), social skill(normal), specialty(neurology), symptom(motor tics).
- Bipolar disorder - type(psychotic disorder), indication(elevated moods).
- Schizophrenia - type(psychotic disorder), indication(hallucinations).
- Down syndrome - type(genetic disorder), symptom(delayed physical growth), Face features(long and narrow), ears features(large), brain function(intellectual disability).
- Fragile X syndrome - type(genetic disorder), face features(small chin and slanted eyes), brain function(intellectual disability).

## 3.	Стратегията на работа на интерпретатора на знания – обяснете работата на Пролог в използвания от вас вариант.
  Използван е вграденият в Пролог - backward chaining. Това е техниката за извод, която използва IF-THEN правила, като разбива многократно целта на подцели.
Интерпретаторът доказва или опровергава всяка цел.
Правилата са използвани за представяне на знания, а интерпретатора на пролог за достигане на заключения. 
Пример: IF
    type is neurodevelopmental disorder
		     and the symptom is impaired communication
		     and the skill level is low 
	         THEN
    the mental disorder is Autism 	

## 4.Видът на получения резултат 
Целта на системата е да се избере най-добрия избор от много възможности.
Като резултата след достигане на крайната цел ще изведе “Condition was diagnosed as ….”
и достиганатото умствено заболяване и ще завърши с true.
Ако не успее да достигне до такова ще завърши с "The diagnose was not found"

