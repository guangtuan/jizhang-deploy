#!/bin/bash

cat /dev/null > init.sql;

docker exec jizhang-deploy_mysql_1 sh -c "mysqldump --no-data -p jizhang -uroot -p"$JIZHANG_DB_PASSWORD"" > structure.sql;

cat create_db.sql >> init.sql;
cat structure.sql >> init.sql;

echo 'done';