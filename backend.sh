curl -sL https://rpm.nodesource.com/setup_lts.x | bash

dnf install nodejs -y
cp backend.service /etc/systemd/system/backend.service  #note: we brought this file upper because evertime i tried to run the command it was always telling me there was no file like that in that directory. so we had to bring it up because of  cd /app which came above it )

useradd expense
mkdir /app

curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip

cd /app
npm install



systemctl daemon-reload

systemctl enable backend
systemctl start backend


dnf install mysql -y
mysql -h mysql.devopsafrican.online -uroot -pExpenseApp@1 < /app/schema/backend.sql