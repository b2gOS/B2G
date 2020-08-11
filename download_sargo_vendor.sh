#!/bin/bash

# Download the vendor blobs from https://developers.google.com/android/drivers#sargo

FOUND=0

download() {
if [ -f "$1" ]
then
	echo "$1 already downloaded."
	FOUND=$(($FOUND + 1))
else
	wget https://dl.google.com/dl/android/aosp/$1
fi
}

download google_devices-sargo-qq3a.200805.001-ca5e20a1.tgz
download qcom-sargo-qq3a.200805.001-ebd290fb.tgz

if [ $FOUND != 2 ]
then
  echo "About to extract files."
  # Cleanup vendor/
  rm -rf vendor/
  # Extract the scripts.
  tar xzf google_devices-sargo-qq3a.200805.001-ca5e20a1.tgz
  tar xzf qcom-sargo-qq3a.200805.001-ebd290fb.tgz
  ./extract-google_devices-sargo.sh
  ./extract-qcom-sargo.sh
  rm -f google_devices-sargo-qq3a.200805.001-ca5e20a1.tgz
  rm -f qcom-sargo-qq3a.200805.001-ebd290fb.tgz
  rm -f extract-google_devices-sargo.sh
  rm -f extract-qcom-sargo.sh
fi

echo "Done."

