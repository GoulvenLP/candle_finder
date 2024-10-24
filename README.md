# README
Auteur: Goulven Le Pennec<br/>
10/2024

### Guide d'utilisation de Candle finder

Bienvenue dans le guide d'installation de **Candle finder**<br/><br/>
Aucune installation n'est requise pour cette application :-)

### 1 - Descriptif
**Candle finder** est une application de référencement et de signalement d'anniversaires, un grand plus pour ne plus passer à côté des bougies!


### 2 - Contenu du package
Le package contient 4 fichiers:
- ajoute.sh
- calc.sh
- cherche.sh
- main.sh

### 3 - Paramétrage

#### 3.1 - Base de donneés
Créer dans le répertoire où se trouvent les quatre fichiers, un fichier nommé `dates.txt`.

#### 3.2 - Exécutables
Modifier le statut des exécutables: ouvrir un terminal puis entrer les commandes successives suivantes pour rendre les scripts exécutables.
```bash
chmod u+x ajoute.sh
chmod u+x calcAge.sh
chmod u+x cherche.sh
chmod u+x main.sh
```

### 4 - Lancement
- Ouvrir un terminal
- Exécuter le fichier *main.sh*:
```bash
./main.sh
```
Une IHM se lance avec des informations:
- Présence d'un anniversaire à fêter ce jour ou non
- Une liste de choix à réaliser regroupée sous le titre *Chercher*

Si un/des anniversaire(s) survient/nent le jour en question, le nom de la/des personne(s) concernée(s) est/sont affichée(s) à l'écran ainsi que son/leur âge. Sinon un message signale l'absence d'anniversaire.

**Tous les choix de sélection dans le menu se font en entrant le numéro de l'index associé à un titre**

Par exemple pour sélectionner une recherche par prénom, il faudra entrer 1 dans le terminal puis valider avec la touche *\<Entrée>*.

Concernant la liste de choix possibles:

#### 4.1 Prénom
Permet de rechercher quelqu'un dans la base de données par son prénom. Les **recherches** ne sont pas sensibles à la casse mais sont **sensibles aux caractères spéciaux** (tels é, è, ê, ô, ...). Par exemple, une recherche de "Beatrice" se soldera par un échec si cette personne est enregistrée sous "B**é**atrice".

#### 4.2 - Nom
Permet de rechercher un individu par son nom de famille. Les critères sont les mêmes que ceux du prénom concernant la casse et les caractères spéciaux.

#### 4.3 - Date de naissance
Permet de rechercher un individu par sa date de naissance

Si au moins un individu est trouvé lors d'une recherche, il sera affiché à l'écran sous le format: <br/>
<Prénom> \<Nom>\<Date de naissance>

Si plusieurs individus correspondent au paramètre de recherche, ils seront affichés au nombre d'une personne par ligne.

### 5 - Ajout
Il est possible d'ajouter des individus à la base de données en suivant la procédure décrite.
1. Entrer le nom de famille de la personne à ajouter
2. Entrer le prénom de la personne à ajouter
3. Entrer sa date de naissance

Si l'ajout vous paraît trop fastidieux sous cet angle, il est également possible de remplir la base de données manuellement.
Veiller scrupuleusement à respecter le format décrit ci-dessous:
- Une personne par ligne
- format <Prénom> \<Nom>\<Date de naissance>
- Un seul espace entre les 3 paramètres décrits ci-dessus
- S'il y a des espaces au sein d'un nom ou bien d'un prénom, compléter ces espaces par le caractère '_'.
- Le format de la date de naissance doit être jj/mm/aaaa.
- Aucun champ ne doit être vide

**ex:**<br/>
```
Jean DE_LA_FONTAINE 8/07/1621
```
### 6 - Suppression

Il n'existe pas à ce jour de fonction de suppression de personne de la base de données. Pour ce faire, ouvrir le fichier *dates.txt* et supprimer manuellement l'intégralité de la ligne où se trouve l'individu.
- Ne pas laisser de lignes vides au sein de la base de données
- Si la dernière ligne est effacée, s'assurer de l'existence d'un renvoi de ligne après la dernière personne référencée.