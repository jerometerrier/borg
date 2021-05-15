#/bin/bash

#restore un backup

# cd /restore
# borg extract --list /sauvegarde::4fcaff2f0047_19.07.2020 

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-g|h|v|V]"
   echo "options:"
   echo "g     Print the GPL license notification."
   echo "h     Print this Help."
   echo "v     Verbose mode."
   echo "V     Print software version and exit."
   echo
}

init()
{

docker run --rm -it --name borg \
  -v /home/jerome/Téléchargements/test_sauvegarde2:/sauvegarde \
  -v /home/jerome/Images/:/source:ro \
  borg:stable \
  init --encryption=repokey /sauvegarde
}


################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################
################################################################################
# Process the input options. Add options as needed.                            #
################################################################################
# Get the options
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

echo "Hello world!"