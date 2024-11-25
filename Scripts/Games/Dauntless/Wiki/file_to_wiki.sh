#!/bin/bash

while read line;
do
    # change the field separator from " - " to ";"
    resep="$( echo "${line}" | sed 's/ - /;/g' )"
    # title is the first field
    title="$( echo ${resep} | cut -d';' -f1 )"
    # rarity is the 2nd field
    rarity="$( echo ${resep} | cut -d';' -f2 )"
    # how to get it is the 3rd field
    how="$( echo ${resep} | cut -d';' -f3 )"
    # description is basically how to get, but with minor changes
    descr="$( echo "${how}" | sed 's/Being part/Awarded to members/; s/guilds in Gauntlet/guilds for Gauntlet/; s/Gauntlet/[[Gauntlet]]/' )"
    # Add the [[link]] to -> Gauntlet to the ${how}.
    how="$( echo "${how}" | sed 's/Gauntlet/[[Gauntlet]]/' )"

    # just for debug purposes
    #echo "'${line}'"
    #echo "'${resep}'"
    #echo "'${title}'"
    #echo "'${rarity}'"
    #echo "'${how}'"
    #echo "'${descr}'"

echo "${title}" | sed 's/ /_/g'
echo "{{Title
|Rarity=${rarity}
|ObtainedFrom=${how}
|Description=${descr}.
}}"

echo "--------------------------------------------------"

done < Gauntlet_Titles.txt
