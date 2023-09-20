#so all the things common in my syntaxes will be kepy here
# so i will then change log_file=/tmp/expense.log and make a reference to it as a variable in all the files where the log_file=/tmp/expense.log is used.
#this will be referenced as source common.sh

log_file=/tmp/expense.log

download_and_extract() {
echo download $component code
curl -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip &>>$log_file
failure_and_success
echo extracting frontend zip file
unzip /tmp/$component.zip >>$log_file
failure_and_success
}

download_and_extract2(){
  echo downloading the artifact for backend.
  curl -s -o /tmp/$component2.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>$log_file
  failure_and_success
  echo unziping /tmp/$component2.zip file
  unzip /tmp/$component2.zip &>>$log_file
  failure_and_success
}

failure_and_success(){
  if [ $? -eq 0 ]; then
  echo -e "\e[32msuccess\e[0m"
  else
  echo -e "\e[33mfailure\e[0m"
  exit 2
  fi
}
# i want to try this as a function and see if it works