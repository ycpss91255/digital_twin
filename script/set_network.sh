#!/usr/bin/env bash

set -euo pipefail

echo "The network cards found in this computer are as follows:"
readarray -t NetworkCard < <(ifconfig | awk '/^[a-zA-z0-9]+:/ {
    print substr($1, 1, length($1) - 1)
}')

all_card=0

for i in "${NetworkCard[@]}"; do
    all_card=$((${all_card}+1))
    echo "${all_card} ${i}"
done

read -p "$(echo -e "
Please enter the name of the network card to be used.
please enter 1~${all_card}, enter 0 to exit: ")" user_input

if [ ${user_input} -eq 0 ]; then
    echo "User enter is 0, so script execution stops."
    exit 0
elif [ ${user_input} -le ${all_card} ]; then
    CardData=$(ifconfig ${NetworkCard[$((${user_input}-1))]})
    CardMAC=$(echo "${CardData}" | awk '/ether/{print $2}')

    if [[ -z "${CardMAC}" ]]; then
        echo "this card not found MAC address."
        exit 1
    fi
else
    echo "Enter is error number."
    exit 1
fi

CardMAC=$(echo "${CardData}" | awk '/ether/{print $2}')

echo "${CardMAC}"
CardType=$(sudo lshw -class network \
    | awk -v mac=${CardMAC} -F ':' '{
        for (i=NF; i>0; i--) {
            print "%s ", $i
            if ($i == mac) {
                # printf "%s ", $i;
                break;
            }
        }
    }')

# sudo lshw -class network | awk -v mac=${CardMAC} 'tolower($0) ~ /description/ && tolower($0) ~ /wireless/ {wireless=1} /address: / && $2==mac {if (wireless) {print "Wireless"} else {print "Wired"}}'

# echo "test ${CardType}"

# CardType=$(sudo lshw -class network) \
#     | awk -v mac=${CardMAC} -F ':' '
#         BEGIN {
#             found = 0;
#         }
#         {
#             for (i=NF; i>0; i--) {
#                 if ($i == mac) {
#                     printf "%s ", $i;
#                     break;
#                     found = 1;

#                 # } else if (found && $i ~ /[[:space:]]+description/) {
#                     # for (j=2; j<=NF; j++) {
#                         # printf "%s ", $j;
#                     # }
#                     # exit;
#                 }
#             }
#         }')

# echo "${CardType}"
# read -p "$(echo -e "
# you
# please enter 1~${all_card}, enter 0 to exit: ")" user_input



