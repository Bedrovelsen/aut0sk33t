#!/bin/bash

TARGET=$1
echo -e "A'ight homie! We aut0sk33tin $TARGET\n\n" 

echo -e "G'nna start gripping subdomaynes yo!\n\n"

echo -e "We gonna crobat this fools assetfinder" 

assetfinder --subs-only "$TARGET" | tee tmpsubz.txt && crobat -s "$TARGET" | tee -a tmpsubz.txt && subfinder -silent -d "$TARGET" | tee -a tmpsubz.txt

sort -u < tmpsubz.txt | tee subz.txt && rm tmpsubz.txt

echo -e "Drive by dem subz to see who awake\n"

echo -e "uncover anyone pretending to be sleeping \n"

echo "$TARGET" | uncover -e shodan,censys -silent -o uncvr.json -json

cat subz.txt uncvr.json | grepaddr -fqdn | httpx --silent -ip -td -fhr -title -threads 1000 -o alive.json -json

cat subz.txt uncvr.json alive.json | grepaddr -ipv4 | sort -u | tee ipz.txt

echo -e "Guess it'z time to nrich these IPz."

nrich -o json ipz.txt | tee nriched.json

echo -e "Go nuclei-r on anyone awake \n"

nuclei -update-templates

cat alive.json | grepaddr -fqdn | httpx --silent | tee urls.txt

nuclei --silent -l urls.txt -s low,medium,high,critical -me resultz | tee vulns.txt
