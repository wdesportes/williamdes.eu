#!/bin/sh

set -eux

# See: https://gist.github.com/williamdes/0d49288fecf83bf491cc1e6366ae7c30
KEY_ID="C4D91FDFCEF6B4A3C653FD7890A0EF1B8251A889"

ME=$(realpath $(dirname $0))

CMD_GPG_EXPORT="gpg --with-fingerprint --with-keygrip --keyid-format long --armor --export --export-options export-local-sigs ${KEY_ID}"

echo "Exported using: $CMD_GPG_EXPORT\n" > $ME/public-key.asc.txt
echo "gpg --refresh-keys" >> $ME/public-key.asc.txt
echo "gpg -v --check-signatures $KEY_ID" >> $ME/public-key.asc.txt

LC_ALL=C.UTF-8 $CMD_GPG_EXPORT > $ME/public-key.asc
LC_ALL=C.UTF-8 gpg -v --check-signatures ${KEY_ID} >> $ME/public-key.asc.txt
