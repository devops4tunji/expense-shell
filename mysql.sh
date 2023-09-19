log_file=/tmp/expense.log

echo disabling mysql default instalation package
dnf module disable mysql -y >>$log_file

echo downloading the mysql community server
dnf install mysql-community-server -y >>$log_file


echo copying mysql.repo into /yum.repos.d/mysql.repo
cp mysql.repo /etc/yum.repos.d/mysql.repo >>$log_file

echo enabling and starting mysqld
systemctl enable mysqld >>$log_file
systemctl start mysqld >>$log_file

echo setting mysql secure instalation
mysql_secure_installation --set-root-pass ExpenseApp@1 >>$log_file

echo loading schema
mysql -uroot  -pExpenseApp@1