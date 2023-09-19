curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo installing nodejs
dnf install nodejs -y >/tmp/expense.log

echo copying backendservice to /system/backendservice
cp backend.service /etc/systemd/system/backend.service >/tmp/expense.log  #note: we brought this file upper because evertime i tried to run the command it was always telling me there was no file like that in that directory. so we had to bring it up because of  cd /app which came above it )

echo removing /app directory
rm -rf /app >/tmp/expense.log # we added this because there was an error in the download process becasue we have cd/app in the script below

echo adding user expense
useradd expense >/tmp/expense.log

echo making a directory /app
mkdir /app >/tmp/expense.log

echo downloading the artifact for backend.
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >/tmp/expense.log

echo changing to the /app directory
cd /app >/tmp/expense.log

echo unziping /tmp/backend.zip file
unzip /tmp/backend.zip >/tmp/expense.log

echo changing changing directory
cd /app >/tmp/expense.log

echo installing node program manager
npm install >/tmp/expense.log

echo systemctl reload
systemctl daemon-reload >/tmp/expense.log
systemctl enable backend >/tmp/expense.log
systemctl start backend >/tmp/expense.log

echo installing mysql
dnf install mysql -y >/tmp/expense.log

echo logging into mysql
mysql -h mysql.devopsafrican.online -uroot -pExpenseApp@1 < /app/schema/backend.sql >/tmp/expense.log