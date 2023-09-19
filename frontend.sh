component=frontend #this means that im subsitutuing the world frontend with component but adding $component
#declaring log_file=/tmp/expense.log as a variable. this will automatically make all the changes to $log_file
#log_file=/tmp/expense.log
#log_file=/tmp/expense.log will now be changed to source common.sh reference the common.sh file where all common coades are stored
source common.sh

echo installing nginx
dnf install nginx -y >>$log_file

echo placing expense config file in nginx and redirecting it /tmp/expense.log
cp expense.conf /etc/nginx/default.d/expense.conf >>$log_file

echo removing the /usr/share/nginx/html directory
rm -rf /usr/share/nginx/html/* >>$log_file

echo changing directory to usr/share/nginx/html
cd /usr/share/nginx/html >>$log_file

download_and_extract



echo enabling nginx
systemctl enable nginx >>$log_file

echo restarting nginx
systemctl restart nginx >>$log_file