#!/bin/bash
MY=$(ypcat passwd | grep "$UID" | cut -d: -f5 | cut -d ' ' -f1);

USERS_WITH_MY_NAME=$(ypcat passwd | grep "$MY" | cut -d: -f1 | sort | uniq);

printf "UZIVATEL\tPOCET PRIHLASENI\n" > prihlaseni.txt;

MY_USERNAME=$(whoami);
MY_VISITS=$(last $MY_USERNAME |wc -l);
printf "%s\t%d\n\n" "$MY_USERNAME" "$MY_VISITS" >> prihlaseni.txt;

touch temp.txt;
COUNTER=1;
TOTAL=$(wc -l <<< "$USERS_WITH_MY_NAME");
TOTAL=$(($TOTAL - 1));
for username in $USERS_WITH_MY_NAME
do
  if [[ $username = $MY_USERNAME ]]; then
    continue;
  fi
  echo "Processing \"$username\" ($COUNTER/$TOTAL)...";
  USER_VISITS=$(last $username | wc -l);
  printf "%s\t%d\n" "$username" "$USER_VISITS" >> temp.txt;
  COUNTER=$(( $COUNTER + 1 ));
done

cat temp.txt | sort -t$'\t' -nrk2 >> prihlaseni.txt;

rm temp.txt