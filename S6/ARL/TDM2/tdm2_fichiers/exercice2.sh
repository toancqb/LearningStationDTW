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
#q1
$egrep_cmd $options $valeurAttribut -m 10 $fichier

#q3
echo "** Q3"

nt='([0-9]{2}(.[0-9]{2}){4})|(\+33\s+\(0\)\s+[1-9](.[0-9]{2}){4})'

$egrep_cmd $options '([0-9]{2}(.[0-9]{2}){4})|(\+33\s+\(0\)\s+[1-9](.[0-9]{2}){4})' -o $fichier
