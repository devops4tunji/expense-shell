#log_file=/tmp/expense.log
#log_file=/tmp/expense.log will now be changed to source common.sh reference the common.sh file where all common coades are stored
source common.sh
component2=backend  #because of back.service everywhere , so we substitute it with $component
#example - cp backend.service /etc/systemd/system/backend.service &>>$log_file

echo downloading rpm
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file
failure_and_success

echo installing nodejs
dnf install nodejs -y &>>$log_file
failure_and_success

echo copying backendservice to /system/backendservice
cp $component2.service /etc/systemd/system/$component2.service &>>$log_file
failure_and_success


echo removing /app directory
rm -rf /app &>>$log_file
failure_and_success


echo adding user expense or not adding
id expense &>>/log_file
if [ $? -ne 0 ]; then
useradd expense &>>$log_file
fi
failure_and_success

echo making a directory /app
mkdir /app &>>$log_file
failure_and_success

echo changing changing directory
cd /app &>>$log_file
failure_and_success

download_and_extract2
failure_and_success

echo installing node program manager
npm install &>>$log_file
failure_and_success

echo systemctl reload
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl start backend &>>$log_file
failure_and_success

echo installing mysql
dnf install mysql -y &>>$log_file
failure_and_success

echo logging into mysql
mysql -h mysql.devopsafrican.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
failure_and_success