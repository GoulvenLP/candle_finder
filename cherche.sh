#!/bin/bash

#RECHERCHE SI UN NOM OU BIEN UN PRENOM SONT PRESENTS DANS LA LISTE 
# $1: type de recherche: {selectPrenom, selectNom, selectAll}
# $2: le paramètre à rechercher
# format de la bdd : prenom nom ddn

if [[ "$1" == "selectPrenom" ]]; then
	grep -Ei "^${2}" dates.txt

elif [[ "$1" == "selectNom" ]]; then
	grep -Ei "^.+ ${2}" dates.txt

elif [[ "$1" == "selectAll" ]]; then
	grep -i "${2}" dates.txt
fi

exit
