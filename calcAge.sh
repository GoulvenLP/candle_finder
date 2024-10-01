#!/bin/bash

#CALCUL DE L'AGE D'UNE PERSONNE
annee=`date +%Y`
nb_li=`wc -l tmp_dates.txt | cut -d ' ' -f 1`

for i in `seq 1 $nb_li`;
do #RECUPERER 3e PARAMETRE ET ISOLER LE 3e ELEMENT QUI EST L'ANNEE
	aNce=`cat tmp_dates.txt | head -n ${i} | tail -n 1 | cut -d ' ' -f 3 | cut -d '/' -f 3`
	age=$((annee - aNce))

	echo "`cat tmp_dates.txt | head -n ${i} | tail -n 1 | cut -d ' ' -f 1,2 | tr _ ' '` fête ses $age ans"

done



exit

