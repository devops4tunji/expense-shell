#log_file=/tmp/expense.log
#log_file=/tmp/expense.log
#log_file=/tmp/expense.log will now be changed to source common.sh reference the common.sh file where all common coades are stored
#echo $? #this will let me know if it fails or does not fail.
#if [$? -eq 0]; then  #using this now to have different outputs
 #echo success
 #else
 #echo failure
 #fi
source common.sh

echo disabling mysql default instalation package
dnf module disable mysql -y &>>$log_file
failure_and_success


echo downloading the mysql community server
dnf install mysql-community-server -y &>>$log_file
failure_and_success

echo copying mysql.repo into /yum.repos.d/mysql.repo
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>$log_file
failure_and_success

echo enabling and starting mysqld
systemctl enable mysqld &>>$log_file
systemctl start mysqld &>>$log_file
failure_and_success

echo setting mysql secure instalation
mysql_root_password=$1
mysql_secure_installation --set-root-pass mysql_root_password &>>$log_file  #here the password was ExpenseApp@1
failure_and_success

echo loading schema
mysql_root_password=$1
mysql -uroot  -pExpenseApp@1