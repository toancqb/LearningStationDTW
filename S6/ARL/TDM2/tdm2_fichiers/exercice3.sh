#!/bin/sh
if [ -x "$(command -v gegrep)" ]; then
    egrep_cmd="gegrep"  # GNU grep for OSX
else
    egrep_cmd="egrep"
fi
options="--color"
fichier="bano-59009.csv"

bis='BIS'
ter="TER"
id="([0-9]|[A-Z])*([A-Z]-)([0-9]+([A-Z]*))"
quatre="$id,([0-9]*[4][0-9]*)($bis|$ter)"

numero_voie="[0-9]*($bis|$ter|[A-Z])*"
voie_ascq_min='([^,a-z]|[0-9]|\s)*'
ascq_min="$id,$numero_voie,$voie_ascq_min,"

#q1
echo "** Q1"
$egrep_cmd $options $quatre $fichier

#q2
echo "** Q2"
$egrep_cmd $options '(.*,){2}.*Ascq.*(,.*){5}' $fichier

#q3
echo "** Q3"
$egrep_cmd $options $ascq_min $fichier 
