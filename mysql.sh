echo disabling mysql default instalation package
dnf module disable mysql -y >>/tmp/expense.log

echo downloading the mysql community server
dnf install mysql-community-server -y >>/tmp/expense.log

echo copying mysql.repo into /yum.repos.d/mysql.repo
cp mysql.repo /etc/yum.repos.d/mysql.repo >>/tmp/expense.log

echo enabling and starting mysqld
systemctl enable mysqld >>/tmp/expense.log
systemctl start mysqld >>/tmp/expense.log

echo setting mysql secure instalation
mysql_secure_installation --set-root-pass ExpenseApp@1 >>/tmp/expense.log

echo logging in to mysql
mysql -uroot mysql.devopsafrican.online -pExpenseApp@1 < /app/schema/backend.sql >>/tmp/expense.log