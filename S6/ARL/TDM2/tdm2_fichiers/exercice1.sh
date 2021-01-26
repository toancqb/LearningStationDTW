#!/bin/sh
if [ -x "$(command -v gegrep)" ]; then
    egrep_cmd="gegrep"  # GNU grep for OSX
else
    egrep_cmd="egrep"
fi
options="--color"
fichier="Cyrano.txt"
#q1
echo "** Q1"
$egrep_cmd $options 'nez' $fichier

#q2
echo "** Q2"
$egrep_cmd $options '\(.*\)' $fichier

#q3
echo "** Q3"
$egrep_cmd $options '\<[a-zA-Z]{5}\>' $fichier

#q4
echo "** Q4"
$egrep_cmd $options '[[:alpha:]]+\s:' $fichier


