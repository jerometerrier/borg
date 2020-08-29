#/bin/bash

#restore un backup

cd /restore
borg extract --list /sauvegarde::4fcaff2f0047_19.07.2020 

