#!/bin/bash

# AJOUTE UNE PERSONNE DANS LE CARNET dates.txt AU FORMAT PRENOM NOM DDN
# variables prenom, nom, ddn
# nb: une phase de pré-traitement doit avoir lieu pour identifier les variables facilement:
# tout espace est comblé par un '_'. ex: 'DE LA VILLEMARQUE' est soumis en tant que 'DE_LA_VILLEMARQUE'
# Ceci devra être pris en compte pour la restitution (tout est traité dans le main)

prenom=$1
nom=$2
ddn=$3

if [[ $# -ne 3 ]]
	then
	exit 1
else 
	pers="${prenom} ${nom} ${ddn}"

	echo ${pers} >> dates.txt
	exit 0
fi
