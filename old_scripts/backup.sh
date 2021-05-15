#!/bin/sh
#
# Script de sauvegarde.
#
# Envoie les sauvegardes sur un serveur distant, via le programme Borg.
# Les sauvegardes sont chiffrées
#

set -e
 
# BACKUP_DATE=`date +%Y-%m-%d`
# LOG_PATH=/var/log/borg-backup.log
 
# export BORG_PASSPHRASE="`cat ~root/.borg/passphrase`"
# BORG_REPOSITORY=borg@nas.example.com:/var/lib/borg-backups/babasse
# BORG_ARCHIVE=${BORG_REPOSITORY}::${BACKUP_DATE}
 
 docker run -it --name borg \
   -e BORG_PASSPHRASE=toto \
   -v /share/Sauvegarde/borg:/sauvegarde \
   -v /share/Logiciels:/source:ro \
   jerometerrier/borg:v1 \
   borg create /sauvegarde::{hostname}_{now:%d.%m.%Y} /source --stats



# borg create \
# -v --stats --compression lzma,9 \
# $BORG_ARCHIVE \
# /etc /var/mail /home \
# >> ${LOG_PATH} 2>&1
 
# Nettoyage des anciens backups
# On conserve
# - une archive par jour les 7 derniers jours,
# - une archive par semaine pour les 4 dernières semaines,
# - une archive par mois pour les 6 derniers mois.
 
borg prune -v $BORG_REPOSITORY \
--keep-daily=7 \
--keep-weekly=4 \
--keep-monthly=6 \
>> ${LOG_PATH} 2>&1