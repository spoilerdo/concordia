#!/bin/sh
#stops execution if script has an error
set -e

cd $CI_PROJECT_DIR/ci/

printf "Filling in SSL CA Certification for Postgress DB connection... \n"

sed -i 's~%DATABASE_CRT%~'"$DATABASE_CRT"'~' azureDbCA.crt.pem

printf "Done... \n"
