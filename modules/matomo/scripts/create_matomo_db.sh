#!/bin/bash

DEDICATED=${dedicated}
INSTANCE=${instancenb}

if [ "$DEDICATED" == "true" ]
then
   matomoschema="${matomo_schema}$INSTANCE"
   matomoname="${matomo_name}$INSTANCE"
else
   matomoschema="${matomo_schema}"
   matomoname="${matomo_name}"
fi


mysqlsh --user ${admin_username} --password=${admin_password} --host ${mds_ip} --sql -e "CREATE DATABASE $matomoschema;"
mysqlsh --user ${admin_username} --password=${admin_password} --host ${mds_ip} --sql -e "CREATE USER $matomoname identified by '${matomo_password}';"
mysqlsh --user ${admin_username} --password=${admin_password} --host ${mds_ip} --sql -e "GRANT ALL PRIVILEGES ON $matomoschema.* TO $matomoname;"

echo "Matomo Database and User created !"
echo "MATOMO USER = $matomoname"
echo "MATOMO SCHEMA = $matomoschema"
