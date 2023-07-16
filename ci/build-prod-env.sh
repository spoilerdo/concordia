#!/bin/sh
#stops execution if script has an error
set -e

#duplicate .env.template and fill in values
printf "Copying template env file... \n"
cp .env.template .env

printf "Filling in all the variables... \n"
sed -i 's~%HOST%~'"$HOST"'~' .env
sed -i 's~%APP_KEYS%~'"$APP_KEYS"'~' .env
sed -i 's~%API_TOKEN_SALT%~'"$API_TOKEN_SALT"'~' .env
sed -i 's~%ADMIN_JWT_SECRET%~'"$ADMIN_JWT_SECRET"'~' .env
sed -i 's~%JWT_SECRET%~'"$JWT_SECRET"'~' .env

sed -i 's~%DATABASE_HOST%~'"$DATABASE_HOST"'~' .env
sed -i 's~%DATABASE_PORT%~'"$DATABASE_PORT"'~' .env
sed -i 's~%DATABASE_NAME%~'"$DATABASE_NAME"'~' .env
sed -i 's~%DATABASE_USERNAME%~'"$DATABASE_USERNAME"'~' .env
sed -i 's~%DATABASE_PASSWORD%~'"$DATABASE_PASSWORD"'~' .env

printf "Done... \n"
