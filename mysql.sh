#log_file=/tmp/expense.log
#log_file=/tmp/expense.log
#log_file=/tmp/expense.log will now be changed to source common.sh reference the common.sh file where all common coades are stored
source common.sh

echo disabling mysql default instalation package
dnf module disable mysql -y &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo downloading the mysql community server
dnf install mysql-community-server -y &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo copying mysql.repo into /yum.repos.d/mysql.repo
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo enabling and starting mysqld
systemctl enable mysqld &>>$log_file
systemctl start mysqld &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo setting mysql secure instalation
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo loading schema
mysql -uroot  -pExpenseApp@1