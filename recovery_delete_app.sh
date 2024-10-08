# This will delete apps on mac system should be run in the recovery terminal 
#!/bin/bash

echo "Désactivation du SIP..."
csrutil disable && echo "SIP désactivé"

echo "Montage de la partition en lecture-écriture..."
mount -uw / && echo "Partition montée en lecture-écriture"

echo "Suppression des applications système..."
sudo rm -rf /System/Applications/Chess.app && echo "Échecs supprimé"
sudo rm -rf /System/Applications/FaceTime.app && echo "FaceTime supprimé"
sudo rm -rf /System/Applications/Mail.app && echo "Mail supprimé"
sudo rm -rf /System/Applications/TV.app && echo "Télé supprimé"

echo "Opérations terminées."
