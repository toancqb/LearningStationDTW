#!/bin/sh
if [ -x "$(command -v gegrep)" ]; then
    egrep_cmd="gegrep"  # GNU grep for OSX
else
    egrep_cmd="egrep"
fi
options="--color"
fichier="html/*.html"

nomXML="[a-zA-Z_:][a-zA-Z_:.\d-]*"
refEntite="&$nomXML;"
valeurAttribut='\"([^&<\"]|$refEntite)*\"'
baliseOuvrante="<$nomXML(\s*$valeurAttribut)*\s*>"

num1='([0-9]{2}(.[0-9]{2}){4})'
num2='(\+33\s+\(0\)\s+[1-9](.[0-9]{2}){4})'

#q1
echo "** Q1"
$egrep_cmd $options $valeurAttribut -m 10 $fichier

#q2
echo "** Q2"
$egrep_cmd $options $baliseOuvrante $fichier -o -m 10

#q3
echo "** Q3"
#nt='([0-9]{2}(.[0-9]{2}){4})|(\+33\s+\(0\)\s+[1-9](.[0-9]{2}){4})'
$egrep_cmd $options "$num1|$num2" $fichier -o
