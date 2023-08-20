#!/usr/sbin/nologin

touch .env

echo "ROOT_PASSWORD=$RP" >> .env
echo "DATABASE_NAME=$DBN" >> .env
echo "USER=capstone-$USR" >> .env
echo "USER_PASSWORD=$USR_PSD" >> .env