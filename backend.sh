curl -sL https://rpm.nodesource.com/setup_lts.x | bash

dnf install nodejs -y

useradd expense
mkdir /app

curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip

cd /app
npm install

cp backend.conf /etc/systemd/system/backend.conf

systemctl daemon-reload

systemctl enable backend
systemctl start backend


dnf install mysql -y
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pExpenseApp@1 < /app/schema/backend.sql