#!/bin/bash

mysql -h192.168.1.206 -umydb -pmydb mydb -e "truncate table mytable"
for i in `seq 1 100`;do
  name="yangjingfeng$i"
  echo $name
  sqlclause="insert into mytable values("\"$name\"")"
  echo $sqlclause
  mysql -h192.168.1.206 -umydb -pmydb mydb -e "$sqlclause"
done


#!/bin/bash
mysql -h192.168.1.206 -umydb -pmydb mydb -e "truncate table mytable"

for i in `seq 1 100`;do
  name="yangjingfeng$i"
  mysql -h192.168.1.206 -umydb -pmydb mydb -e "insert into mytable values(\"$name\")"
done


#
#!/bin/bash
for name in `mysql -h192.168.1.206 -umydb -pmydb mydb --skip-column-names -e "select * from mytable"`;do
  ## 设置过期时间为10秒
  /usr/local/redis/bin/redis-cli set  $name $name ex 10
done