#log_file=/tmp/expense.log
#log_file=/tmp/expense.log will now be changed to source common.sh reference the common.sh file where all common coades are stored
source common.sh
component2=backend  #because of back.service everywhere , so we substitute it with $component
#example - cp backend.service /etc/systemd/system/backend.service &>>$log_file

echo downloading rpm
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo installing nodejs
dnf install nodejs -y &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo copying backendservice to /system/backendservice
cp $component2.service /etc/systemd/system/$component2.service &>>$log_file  #note: we brought this file upper because evertime i tried to run the command it was always telling me there was no file like that in that directory. so we had to bring it up because of  cd /app which came above it )
echo $? #this will let me know if it fails or does not fail.


echo removing /app directory
rm -rf /app &>>$log_file # we added this because there was an error in the download process becasue we have cd/app in the script below
echo $? #this will let me know if it fails or does not fail.


echo adding user expense
useradd expense &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo making a directory /app
mkdir /app &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo changing changing directory
cd /app &>>$log_file
echo $? #this will let me know if it fails or does not fail.

download_and_extract2
echo $? #this will let me know if it fails or does not fail.

echo installing node program manager
npm install &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo systemctl reload
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl start backend &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo installing mysql
dnf install mysql -y &>>$log_file
echo $? #this will let me know if it fails or does not fail.

echo logging into mysql
mysql -h mysql.devopsafrican.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
echo $? #this will let me know if it fails or does not fail.