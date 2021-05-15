#!/bin/sh
#
#
 
 docker run -it --name borg \
   -e BORG_PASSPHRASE=toto \
   -v /share/Sauvegarde/borg:/sauvegarde \
   jerometerrier/borg:v1 \
   borg init --encryption=repokey /sauvegarde



