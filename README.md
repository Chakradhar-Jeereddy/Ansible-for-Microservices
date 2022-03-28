# Ansible for Microservices


Deploy an Ec2 instance and install Jenkins, Ansible and python.

To test ansible pull and push mechanism. 

yum install python3-pip -y

pip3 install pip --upgrade

pip3 install ansible

ansible -i inventory-sample ansible-node.roboshop.internal  -b -m yum -a name=nginx  -u centos -k
 
ansible -i inventory-sample ansible-node.roboshop.internal  -m ping  -u centos -k

ansible -i inventory-sample ansible-node.roboshop.internal  -b -m systemd -a "name=nginx state=started"  -u centos -k
