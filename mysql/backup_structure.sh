#!/bin/bash

docker exec jizhang-deploy_mysql_1 sh -c "mysqldump --no-data -p jizhang -uroot -p"$JIZHANG_DB_PASSWORD"" > structure.sql