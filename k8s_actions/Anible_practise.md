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