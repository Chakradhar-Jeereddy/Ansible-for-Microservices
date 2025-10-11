```
ansible -m command -a "uname -r" dev
ansible --list-hosts dev

Elevated privilege list
become_method: sudo
become_ask_pass=True
become_user: root
become: True

command can't access envs of managed host but shell can
the set command works only for shell
 ansible -m shell -a "set" dev
 ansible -m command -a "set" dev (fails)


## Implementing playbooks
- hosts: dev
  tasks:
    - name: copy the files
      copy:
        src: /root/input.sh
        dest: /u01
        owner: postgres
        group: postgres
        mode: 0777
      when: ansible_distribution=="RedHAT"

---
- hosts: dev
  gather_facts: false
  tasks:
   - name: Start vsftpd service
     service:
      name: vsftpd
      state: started


- hosts: localhost
  tasks:
   - name: loops
     debug:
      msg: "my name is {{ item.name }}"
     loop:
      - { name: chakra }
      - { name: swarna }
      - { name: nihal }
~




