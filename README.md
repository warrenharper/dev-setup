dev-setup
=========
To run the script install ansible cd into the project root directory and run
```shell
ansible-playbook -e ansible_user=<user> -e ansible_host=<host> -e ansible_port=<port> -i hosts desktop.yml -kK
```
