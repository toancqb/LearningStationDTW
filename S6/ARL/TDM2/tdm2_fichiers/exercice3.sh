#!/bin/sh
if [ -x "$(command -v gegrep)" ]; then
    egrep_cmd="gegrep"  # GNU grep for OSX
else
    egrep_cmd="egrep"
fi
options="--color"
fichier="bano-59009.csv"

#q1
echo "** Q1"
$egrep_cmd $options ',[0-9]*4[0-9]*(TER|BIS),' $fichier

#q2
echo "** Q2"
$egrep_cmd $options '59009*,*,*Ascq*,*' $fichier

