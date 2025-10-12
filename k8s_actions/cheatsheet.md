Disadvantages of shell
========================
1. No error handling
2. OS specific, homogeneous
3. Little complex to understand
4. Not idempotent
5. Complex to handle large number of servers

1. copy the script and dependent files, mongo.repo and mongodb.sh
2. then execute from main server

Configuration management
========================
Install few system packages
Installing Programming runtime
Creating folder
Creating system user
Downloading the code
Unzipping the code
Installing Dependencies
Creating systemctl service files
Staring the application

Baseling/Configuring server is nothing but making it ready to host the application

Deployment -> Downtime
===========
1. Stop the application
2. remove the old code
3. Download new code
4. Install dependencies
5. restart the application

Push vs Pull
============
Push -> Ansible is popular, it recently implemented pull too
Pull -> Chef

BANG -> HYD
==============
DTDC

Polling/Pulling
===============
I go to DTDC everyday and check whether I received courier or not

Event Driven/Push
===============
You carry on, when you get courier it will be delivered

SYS-1 -> Broadcast
SYS-1 -> SYS-2

Linux command == Ansible Module/Collection

dnf install nginx -y
dnf is a command
install and nginx -> arguments

keep all the commands in a file, we call it as shell and run the script

Playbook -> collections of plays, a play is a list of tasks to be executed on the target server

{
	"name": "siva",
	"email": "siva@gmail.com" 
	"password": "siva123"
}

DTO -> Data transfer objects
=======
XML JSON YAML

100 year back go to bank
====================

name
acc no
amount
branch
date
sign

1. Easy to do mistakes
2. Time consuming

Forms == Templates
=====
Name
Acc No
Date
Amount
Sign

XML -> Extensive Markup Language
================================
<Name>Sivakumar</Name>

HTML -> Hyper text markup language
<h1>This is main heading</h1>
<h2>This is side heading</h2>

YAML -> Yet another markup language

indentation -> spacing

ansible all -i 172.31.26.71, -e ansible_user=ec2-user -e ansible_password=DevOps321 -m ping
########################################################################################################################
Varialbes
==============
NAME=Trump

$NAME
${NAME}

Data types

Conditions
=============
if, if else
when

Loops
============
{{ item }}

ansible all -i 172.34.23.53, 

ansible all -i "172.34.23.53,172.34.23.54" 

variables
data types
conditions
loops

functions
===========
taking input and providing the output (input pipe output), execute whenever we call
functions == filters
we can write functions but we need to write python code..
we can use default in built functions from ansible
Fuctions can be used for
1) type conversion (items2dict) (dict2items), sting to list using split function and to into using int function
2) case conrvertion (upper,lower)
3) ip address validation

DevOps, Linux, Shell, Ansible -> String
,
DevOps
Linux
Shell
Ansible

gather_facts

facts == variables

255.255.255.255

345.4329.43209.4332

shell vs command
================
ansible -> node

remote login -> take login, execute command and comeout

or login inside the server and execute the command

when we dont have readymade modules available, we can execute command or shell module

command -> a simple command no need of access to shell environment like variables, bash, piping, etc..
shell Module -> can access variabless, pipes, redirections, shell environment, etc.

VAR_NAME=$(command)

1. we can handle
2. we can't handle

creating the user but user already exist

id roboshop -> 

Roboshop using Ansible
======================
Instances creation

1. create instance
2. update r53 record private ip if not frontend, if frontend updated public ip
######################################################################################################################
functions == filters
error handling
shell vs command
ansible to create ec2 instances and r53 records

ansible controller/server == where ansible installed

console
aws cli
ansible
terraform
python
############################################################################################################################
ansible-playbook -i inventory.ini mongodb.yaml
ansible-playbook -i inventory.ini redis.yaml
ansible-playbook -i inventory.ini mysql.yaml
ansible-playbook -i inventory.ini rabbitmq.yaml

Roles
=======
DRY

variables
functions

Ansible roles is a proper directory structure of creating playbooks, maintaining and reusing. roles will have tasks, files, vars, defaults, handlers, templates. By default role will try to load main.yaml in each directory

rm -rf /usr/share/nginx/html/

################################################################################################################
instances=['mongodb','redis','mysql','rabbitmq','catalogue','user','cart','shipping','payment','frontend']

ansible-playbook -i inventory.ini main.yaml -e "component=mongodb"
ansible-playbook -i inventory.ini main.yaml -e "component=redis"
ansible-playbook -i inventory.ini main.yaml -e "component=mysql"
ansible-playbook -i inventory.ini main.yaml -e "component=rabbitmq"

app setup
nodejs setup
systemd

catalogue is one role, common is another role
catalogue should import the tasks in common role

mongodb-dev.daws86s.fun
mongodb-qa.daws86s.fun

mongodb.daws86s.fun

when there is a change in something notify others to reload

notifiers or handlers

template
==========
fixed form with placeholders

templatising file is nothing but keeping the placeholders, submitting the actual values at runtime.

jinja2 templating

ansible templates are jinja2 formatted files, there will be placeholders inside the file, actual values will be submitted at runtime and copied to remote server
##################################################################################################
ansible configuration
====================
1. ANSIBLE_CONFIG env variable
2. pwd
3. home directory
4. /etc/ansible/ansible.cfg

logs
debug -vvv

include_role vs import_role

include_role
==============
it includes at run time, checks while processing. include will not respect tags. We must explicitly set inside the tasks

import_role
==============
imports the role before exection and parse it, checks before processing. applying tags at the import setup to all the tasks automatically.

dynamic inventory
===============
autoscaling, when traffic increase servers will be increased
a plugin is provided aws and ansible to fetch the IP address dynamically

query aws
us-east-1, ec2, running and name should be frontend

tasks -> execute something on the remote/target server
plugins -> connects to other system and fetch required information

*.aws_ec2.yml/yaml

ansible can connect to AWS dynamically to fetch the IP address using dynamic inventory plugin(amazon.aws.aws_ec2), this helps in autoscaling kind of environment, where fetching the IP address statically is not possible

secrets
==========
vault -> secured place to keep the secrets

ansible-vault

ansible-vault create vault.yaml

secrets manager
===============
AWS is a platform

hashicorp vault

store key inside the server

Forks
=============
global paramete, applies to all roles and tasks
``` 
ansible-playbook site.yaml --forks 50
(or)
[defaults]
forks = 50

Resource usage: Increasing forks allows for faster execution on a large number of hosts but consumes more resources (CPU and memory) on the Ansible control node.
                Adjust the value based on your control node's capacity.
Target host count: If the number of target hosts is less than the forks value, Ansible will only use as many forks as there are hosts.
Performance vs. Stability: While higher forks can improve performance, excessively high values can lead to resource exhaustion and instability.
SSH Optimization: For large-scale deployments, consider enabling SSH optimization features like ControlMaster
                  and ControlPersist in ansible.cfg to reduce SSH connection overhead, especially when using roles with numerous tasks.
######################################################

My notes

Fixed form with placeholder

Templatizing files means keeping the placeholders and submitting actual values at runtime.

jinja2 templating


Ansible configuration file 
preferences

ANSIBLE_CONFIG
ansible.cfg (in current directory)
~/.ansible.cfg (in the home directory)
/etc/ansible/ansible.cfg (default)


ansible.cfg
  inventory = ./hosts.ini
  log_path = /var/log/ansible.log


tag is used to run specific task
--skip-tags
--tags


Difference between include and import

- name: include the role
  include_role:
  tasks_from:

- name: import the role
  import_role:
  tasks_from:


include parse the role during execution and this will not automatically apply the tags inside the tasks
import parse the role before execution and this will apply the tags automatically inside the tasks


dynamic inventory
================

plugin -> connects to another system and fetches required information

Use aws plugin to fetch inventory information
the filename should be with extension aws_ec2.yaml
the file is plugin.aws_ec2.yaml
```
ansible-inventory -i plugin.aws_ec2.yaml --graph
@all:
  |--@ungrouped:
  |--@aws_ec2:
  |  |--172.31.19.16
  |  |--172.31.16.246
  |  |--172.31.24.127
  |  |--172.31.21.227
```

Secrets
=================
Secure place to keep secrets
Ansible Vault - The most annoying feature in ansible is the password to decrypt the vault file need to placed on server and should 
supply it while executing the play. To overcome this use AWS secret manager.

ansible-vault create test.yaml

New Vault password:
Confirm New Vault password:

cat test.yaml

$ANSIBLE_VAULT;1.1;AES256
62306238303235373437343338336161323436363335313333353631303433396565636533396634
6435383166613164303634303538623037646536636433610a383331336465666533393565386164
39386634643166303134303632376232383965373930386630333836616336316363336538663233
3436646566643234340a623837633963646531396266383736313234613765393834313933333032
3063


ansible-vault view test.yaml
Vault password:
nihubaba

ansible-vault edit test.yaml

ansible-playbook -i inventory.ini main.yaml -e "commponent=MySQL" --ask-vault-pass

ansible.conf
vault_password_file=/etc/ansible/mysql_vault_pass.txt


secrets manager
#########################
AWS is a platform - Say that recently moved from ansible vault to secret manger


Ansible connecting to multiple servers parallelly
#####################################################
forks - default is 5
set the many you want in config file
forks: 2



