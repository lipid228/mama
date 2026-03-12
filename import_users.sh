#!/bin/bash

FILE="/media/additional/Users.csv"

while IFS=';' read -r firstname lastname role phone ou street zip city country password; do
    samba-tool user add "$firstname.$lastname" "$(echo "$password" | tr -d '[:space:]')" \
     --given-name="$firstname" --surname="$lastname" --job-title="$role" --telephone-number="$phone" --department="$ou" \
     --description="$zip,$country,$city,$(echo $street | tr -dc '[[:print:]]')"
done < <(tail -n +2 "$FILE")
