# Ansible for Microservices


Deploy an Ec2 instance and install Jenkins, Ansible and python.

To test ansible pull and push mechanism. 

yum install python3-pip -y

pip3 install pip --upgrade

pip3 install ansible

ansible -i inventory-sample ansible-node.roboshop.internal  -b -m yum -a name=nginx  -u centos -k

ansible -i inventory-sample dev -b -m yum -a "name=nginx state=present" -ucentos -k

ansible -i inventory-sample dev -b -m yum -a "name=nginx state=absent" -ucentos -k
 
ansible -i inventory-sample ansible-node.roboshop.internal  -m ping  -u centos -k

ansible -i inventory-sample ansible-node.roboshop.internal  -b -m systemd -a "name=nginx state=started"  -u centos -k

In Latest ansible version collection concept is introduced.

Ansible playbook is written in markup language, it helps in sharing information between systems, also between users and systems
xml,json and yaml


ansible -i inventory-sample dev -m ping -ucentos -k


ansible -i inventory-sample dev -b -m systemd -a "name=nginx state=started" -ucentos -k

#Running the commands is manual, to run multiple tasks use yaml

Mark language to communicate between users and systems and between systems
XML is based on tagging
<courseName>Devops</courseName>
<timing>
  <morning>2am</morning>
  <evening>3pm</evening>
</timing>
<days>
 monday,
 sunday
 </days>

We send this file program, program reads it, fills the information and sends an email

JSON

{
"CourseName": "devops",
"TrainerName" "Chakra"
"Trainers": [
  "chakra@gmail.com",
  "ram@gmail.com"
 ]
"days": 
   { "monday": 20,
     "sunday": 30
  }
}

YAML
CourseName: Devops
Timing:
 -Morning
 -Evening
Days:
 Sunday: 3AM
 Monday: 2AM

Mark language will have data as 
key - value (Regular key value)
Key - Multiple Values (list) (ex: trainees)
Key - key - value (map,dict) (ex: timing)

CourseName: "DevOPS"
Trainername: "Chakra"
timings:
  - 0600IST
  - 07730IST
topics:
 aws:
  - ec2
  - s3
 devops: ["Ansible", "Shell Scripting"]
phoneNumbers: { personal: 293, mobile: 421 }

1) Indentation is the way of YAML inputs provided
2) Always use uniform spacing
3) Tab space are not allowed, default use the double space
4) Based on the program you are dealing, keys are provided by program, we have to
fill those values as per our requirement.
5) Some cases we create our own keys, mainly variables
6) Some cases the values also will be predefined, we have to choose only one of them.


