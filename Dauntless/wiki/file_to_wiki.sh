#!/bin/bash

file="Gauntlet_titles.txt"

while IFS=';' read -r name rarity season; do
    case "$rarity" in
        Uncommon)
            obtained="Participating in [[Gauntlet]] Season $season"
            description="Awarded to members of all guilds that participated in Gauntlet Season $season."
            ;;
        Epic)
            obtained="Being part of the Top 100 guilds in [[Gauntlet]] Season $season"
            description="Awarded to members of the Top 100 guilds for Gauntlet Season $season."
            ;;
        Legendary)
            obtained="Being part of the Top 5 guilds in [[Gauntlet]] Season $season"
            description="Awarded to members of the Top 5 guilds for Gauntlet Season $season."
            ;;
        *)
            obtained="No information available."
            description="No description available."
            ;;
    esac

    echo "----------------------------------------"
    echo "$name"
    echo "{{Title"
    echo "|Rarity=$rarity"
    echo "|ObtainedFrom=$obtained"
    echo "|Description=$description"
    echo "}}"
done < "$file"
echo "----------------------------------------"
