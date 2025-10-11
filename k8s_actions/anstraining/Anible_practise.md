:::

:
```
sudo dnf install ansible -y
ansible  all -i 172.31.27.76, -m service -a "name=nginx state=started" -e "ansible_user=ec2-user  ansible_password=DevOps321"
ansible  all -i 172.31.27.76, -m service -a "name=nginx state=stopped" -e "ansible_user=ec2-user  ansible_password=DevOps321"
ansible  all -i 172.31.27.76, -b -m yum -a "name=nginx state=latest"  -e "ansible_user=ec2-user  ansible_password=DevOps321"
```

```
- hosts: worker
  gather_facts: no
  tasks:
   - name: ping test
     ping:

[{hosts": "worker", "gather_facts": "no", "tasks": { "name": "ping test", "ping": None}}]

Command: ansible-playbook test.yaml -i hosts -e "ansible_user=ec2-user ansible_password=DevOps321"
```

```
- hosts: worker
  gather_facts: no
  tasks:
   - name: ping test
     ping:

[{hosts": "worker", "gather_facts": "no", "tasks": { "name": "ping test", "ping": None}}]

Command: ansible-playbook test.yaml -i hosts -e "ansible_user=ec2-user ansible_password=DevOps321"     
```

```
=======
## Yaml
Indenation based like python
Key: Value
Name: nginx

Keys are case sensitve
To list hierarchy
persion:
  name: John
  age: 30
  Address:
   city: New York
   zip: 10013

List
Fruits:
 - apple
 - banana

Nested list
employee:
 - name: Alice
   role: developer
 - name: Bob
   role: Designer

Coverting the above nested list to python list object
employees = [
    {"name": "Alice", "role": "Developer"},
    {"name": "Bob", "role": "Designer"}
]

```
