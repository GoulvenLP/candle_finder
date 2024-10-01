#!/bin/bash
	#cherche les anniversaires du jour + permet de trouver la DDN de qqn de la liste.
	#permet également d'ajouter des personnes à la liste d'anniversaire


# Initialisation des couleurs
setup_colors() {
	if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
		NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
	else
		NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
	fi
}

# Méthode qui gère les affichages en couleur. à appeler au lieu de "echo"
msg() {
  echo >&2 -e "${1-}"
}

# Affiche le nom de l'application
title() {
	msg "${PURPLE}****\ CANDLE FINDER /**** ${NOFORMAT}"
}

leave() {
	msg "${PURPLE}À bientôt!${NOFORMAT}"
}

# Affiche le jour en cours et cherche un anniversaire sur le jour en cours
# Un message spécifie s'il y a ou non un anniversaire, et si oui donne les noms et âges des personnes concernées.
currentDay() {
	devez=`date +%d/%m/%Y`	#récupération date du jour
	deizHaMiz=`date +%d/%m`
	echo $deiz

	echo "Date : ${devez}"

	./cherche.sh selectAll ${deizHaMiz} > tmp_dates.txt

	results=$(wc -l tmp_dates.txt | cut -d ' ' -f 1)

	if [[ ${results} -ge "1" ]]	#recherche non vide		CHERCHE SI ANNIVERSAIRE AJD
	then
		if [[ ${results} -eq "1" ]]
		then
			msg "${RED}Anniversaire aujourd'hui:${NOFORMAT}"
			msg "${CYAN}"
			./calcAge.sh
			msg "${NOFORMAT}"
			echo ""
		else
			msg "${RED}Anniversaires aujourd'hui:${NOFORMAT}"
			msg "${CYAN}"
			./calcAge.sh
			msg "${NOFORMAT}"
			echo ""
		fi

	else
		msg "${ORANGE}Pas d'anniversaire aujourd'hui\n${NOFORMAT}"
	fi

	rm tmp_dates.txt	#ELIMINATION FICHIER TEMPORAIRE
}

# Affichage du menu
menu() {
	msg "${BLUE}1)${NOFORMAT}Prenom    ${BLUE}2)${NOFORMAT}Nom    ${BLUE}3)${NOFORMAT}Date de Naissance    ${BLUE}4)${NOFORMAT}Ajout    ${BLUE}5)${NOFORMAT}Quitter"
}

# Affiche un message d'erreur lorsqu'un nom ou un prénom ne sont pas trouvés lors d'une recherche
msgNotFound(){
	arg=$1
	msg "${RED}Personne n'a été trouvé sous ce ${arg}. Veuillez vérifier la casse.${NOFORMAT}"
}

msgIncorrectValue() {
	msg "${RED}Valeur incorrecte${NOFORMAT}"
}

msgAddFailed() {
	msg "${RED}Echec de l'ajout de l'individu. Veuillez réessayer.${NOFORMAT}"
}

# Méthode principale. Gère l'ensemble des méthodes
main() {
	msg "${BLUE}Chercher${NOFORMAT}"

	while [ "$sortie" != "true" ]		#AFFICHAGE MENU
	do

		menu
		msg "Quel choix? (entrer le ${BLUE}nombre${NOFORMAT})"
		read choix

		case $choix in					#MENU
			1)					#RECHERCHE PAR PRENOM
			read -p "Entrer le prénom : " prenom
			prenom=$(echo ${prenom} | tr ' ' '_')
			if [[ `./cherche.sh selectPrenom ${prenom}|wc -l`>=1 ]]	#SI AU MOINS UN RESULTAT TROUVE
			then
				msg "${CYAN}"
				./cherche.sh selectPrenom $prenom | tr _ ' '
				msg "${NOFORMAT}"
			else
				msgNotFound "prénom"
			fi
			;;
			
			2)				# RECHERCHE PAR NOM
			read -p "Entrer le nom : " nom		# ecrire avec des '_' pour combler les espaces
			if [[ `./cherche.sh selectNom ${nom} |wc -l`>=1 ]]
			then
				msg "${CYAN}"
				./cherche.sh selectNom $nom | tr _ ' '
				msg "${NOFORMAT}"				
			else
				msgNotFound "nom"
			fi
			;;
			
			3)				# RECHERCHE PAR DDN
			echo "Entrer la date de naissance au format 'jj/mm/aaaa' (ou jj/mm ou bien une fraction de ce format) : " 
			read ddn
			if [[ `./cherche.sh selectAll ${ddn}|wc -l`>=1 ]]
			then
				msg "${CYAN}"
				./cherche.sh selectAll $ddn
				msg "${NOFORMAT}"
			else
				echo "Personne n'a été trouvé sous cette date de naissance."
			fi
			;;
			
			4) #AJOUTER
			echo "Entrer le nom de famille de la personne à ajouter : "
			read nom1 nom2 nom3 nom4 nom5
			
				if [[ ! -z ${nom5} ]]
				then
					nom1="${nom1}_${nom2}_${nom3}_${nom4}_${nom5}"
				elif [[ ! -z ${nom4} ]]
				then
					nom1="${nom1}_${nom2}_${nom3}_${nom4}"
				elif [[ ! -z ${nom3} ]]
				then
					nom1="${nom1}_${nom2}_${nom3}"
				elif [[ ! -z ${nom2} ]]
				then
					nom1="${nom1}_${nom2}"		
				else
					nom1=${nom1}
				fi
			echo "Entrer le prénom de la personne à ajouter : "
			read prenom
			echo "Entrer la date de naissance de la personne à ajouter"
			read ddn
			./ajoute.sh ${prenom} ${nom1} ${ddn}
			if [[ $? -eq "0" ]] #succès de l'ajout
			then
				msg "${GREEN}${prenom} ${nom1} ajouté avec succès!${NOFORMAT}"
			else
				msgAddFailed
			fi
			;;
			
			5) #QUITTER	
			sortie="true"
			;;
			
			*)
			msgIncorrectValue
			;;
			
		esac
	done

	leave

	exit
}

#----------------------------
setup_colors
title
currentDay
main
