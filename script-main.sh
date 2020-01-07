#!/bin/sh

cd /root/script-count-people

echo $(date '+%x %T') " -- Scan du reseau" >> /root/script-count-people/result/logs
./find-people-near.sh > /dev/null


echo $(date '+%x %T') " -- Comptage du nombre de personne" >> /root/script-count-people/result/logs
nbUser=$(./get-people-near.sh)

echo $(date '+%x %T') " -- Requete POST API" >> /root/script-count-people/result/logs
curl -d "name=nbUser&data=$nbUser&location_id=2" -X POST https://fluxtnsi.ddns.net/api/log/create

echo $(date '+%x %T') " -- Sauvegarde des fichiers" >> /root/script-count-people/result/logs
mv result/out* result/save/$(date '+%x %T').csv

