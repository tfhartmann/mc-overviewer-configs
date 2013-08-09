#!/bin/bash

WORKINGDIR='/media/ephemeral0/workspace'
SRC_ZIP='Bungalow.zip'
SRC_BUCKET='bungalow'

CONFIG_URL='https://github.com/tfhartmann/mc-overviewer-configs.git'

# Ok do some stuff
cd $WORKINGDIR

# Add a check to see if the zip file exists, freshen if it exists
s3cmd get s3://${SRC_BUCKET}/${SRC_ZIP}
unzip -o ${SRC_ZIP}

# Add a check to see if the repo was already in place, freshen if it is
git clone ${CONFIG_URL} configs

screen -d -m overviewer.py --verbose --config=${WORKINGDIR}/configs/Bungalow.cfg

# Gen POI / Map labels
# overviewer.py --verbose --config=${WORKINGDIR}/configs/Bungalow.cfg --genpoi
