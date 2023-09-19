echo installing nginx
dnf install nginx -y >/tmp/expense.log

echo placing expense config file in nginx and redirecting it /tmp/expense.log
cp expense.conf /etc/nginx/default.d/expense.conf >/tmp/expense.log

echo removing the /usr/share/nginx/html directory
rm -rf /usr/share/nginx/html/* >/tmp/expense.log

echo download frontend code
curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >/tmp/expense.log

echo changing directory to usr/share/nginx/html
cd /usr/share/nginx/html >/tmp/expense.log

echo extracting frontend zip file
unzip /tmp/frontend.zip >/tmp/expense.log

echo enabling nginx
systemctl enable nginx >/tmp/expense.log

echo restarting nginx
systemctl restart nginx >/tmp/expense.log