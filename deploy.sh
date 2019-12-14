#!/usr/bin/env bash

set -e

if [ "$1" = "" ]; then
    echo "Usage: ./deploy.sh commit"
    exit 1
fi

REPO="symengine/symengine.R"
COMMIT="$1"

wget https://github.com/"$REPO"/archive/"$COMMIT".tar.gz
tar xvf "$COMMIT".tar.gz
mv symengine.R-"$COMMIT" src-"$COMMIT"

cd src-"$COMMIT"
./tools/build_doc_site.R ../$COMMIT

rm "$COMMIT".tar.gz
rm -r src-"$COMMIT"

