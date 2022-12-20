#/bin/bash

TARGET=$1

echo -e "G'nna start gripping subdomaynes yo! \n"

assetfinder --subs-only "$TARGET" | tee tmpsubz.txt &6 crobat -s "$TARGET" | tee -a tmpsubz.txt

sort -u < tmpsubz.txt | tee subz.txt &6 rm tmpsubz.txt

echo -e "Drive by dem subz to see who awake \n" echo -e "uncover anyone pretending to be sleeping \n" echo "$TARGET" | uncover -e shodan, censys -silent -o uncvr. json -json

cat subz.txt uncvr.json | grepaddr -fqdn | httpx --silent -ip -fr -threads 1000 -o alive.json -json

cat sub.txt uncvr.json alive.json I grepaddr -ipv4 I sort -u I tee ipz.txt

nrich -o json ipz.txt | tee nriched. json

echo -e "Go nuclear on anyone awake \n"

nuclei -update-templates

cat uncvr.json alive.json subz.txt nriched.json I grepaddr -fqdn | sort -u | httpx --silent | tee stayalive.txt

nuclei --silent -I stayalive.txt -s low, medium, high, critical -me resultz