#!/bin/sh
if [ -x "$(command -v gegrep)" ]; then
    egrep_cmd="gegrep"  # GNU grep for OSX
else
    egrep_cmd="egrep"
fi
options="--color=auto"
fichier="html/*.html"

nomXML='[a-zA-Z_:]([a-zA-Z_:.\d-])*'
refEntite="&$nomXML;"
valeurAttribut="\"([^<\"])*\"|$refEntite"
baliseOuvrante="<$nomXML(\s*$valeurAttribut)*\s*>"
numTel="([0-9][0-9]|[0-9])(\.([[0-9][0-9])){4}"
numTel1="\+33\s\(0\)\s$numTel"
numTell="$numTel|$numTel1"


#Q1
echo "**Q1"
$egrep_cmd $options $valeurAttribut $fichier  -m 10 #A 10 ligne il n'ya aucune valeur d'attribut 

#Q2
echo "**Q2"
$egrep_cmd $options $baliseOuvrante $fichier -o -m 10

#Q3
echo "**Q3"
$egrep_cmd $options $numTell $fichier -o





