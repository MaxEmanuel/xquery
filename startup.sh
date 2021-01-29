#!/bin/bash

cd /src

basexserver -S
basexclient -Uadmin -Padmin -c "CREATE USER xquery xquery"
basexclient -Uadmin -Padmin -c "create database uni data/uni.xml"
basexclient -Uadmin -Padmin -c "create database uni2 data/uni2.xml"
basexclient -Uadmin -Padmin -c "create database uni3 data/uni3.xml"
basexclient -Uadmin -Padmin -c "GRANT READ ON uni TO xquery"
basexclient -Uadmin -Padmin -c "GRANT READ ON uni2 TO xquery"
basexclient -Uadmin -Padmin -c "GRANT READ ON uni3 TO xquery"

node server.js
