## Shell vs command

- Use when readymade modules are not available.
- Command is simple exections and wont access shell environment like variables, bash, piping and redirections 
- Shell can access variables, pipes, environment.
- Shell and command are not idempotent

### User tested yaml
```
---
- name: command
  hosts: localhost
  gather_facts: no
  become: yes
  tasks:
    - name: test shell with pipe      # works
      shell: cat /etc/passwd|grep root
      register: command_out
    - debug:
       msg: "{{ command_out }}"

    - name: test shell with redirection #works
      shell: ls -ltr >> /tmp/output
      register: redirect_out
    - debug:
       msg: "{{ redirect_out }}"

    - name: test command without pipe  #Simple command without arguments works
      command: cat /etc/passwd
      register: command_out
    - debug:
       msg: "{{ command_out }}"

    - name: test command with pipe     #command module has no access to variables, redirections and pipes and env.
      command: cat /etc/passwd|grep root
      register: command_out
      ignore_errors: yes
    - debug:
       msg: "{{ command_out }}"


    - name: test command with redirection
      command: ls -ltr >> /tmp/output
      register: redirect_out
      ignore_errors: yes
    - debug:
       msg: "{{ redirect_out }}"


    - name: Check if user exists
      command: id roboshop
      ignore_errors: yes
      register: user
    - debug:
        msg: "{{ user }}"

    - name: create user
      user:
        name: roboshop
      when: user.rc != 0
```
