Run playbooks with --extra-vars="ansible_become_pass=$ANSIBLE_PASSWORD"

NOTE! Set $ANSIBLE_PASSWORD env variable with correct password before.

There are variants in running role for preparation Ansible course (ansible_prepare.yml):

I. Boxes source. 
  1) We can put it manually on hosts (folder /opt/prepare/boxes)[default] , run playbook like this:
        ansible-playbook -i hosts ansible_prepare.yml --extra-vars="ansible_become_pass=$ANSIBLE_PASSWORD"
  2) We can upload them from internet (currently from Google Drive):
        ansible-playbook -i hosts ansible_prepare.yml --extra-vars="ansible_become_pass=$ANSIBLE_PASSWORD box_src=remote"

II. Boxes adding to the system's repository behaviour. 
   1) We can just add boxes without replacing them[default]:
        run as in I.1)
   2) We can replace already added boxes to the system (update them):
        ansible-playbook -i hosts ansible_prepare.yml --extra-vars="ansible_become_pass=$ANSIBLE_PASSWORD box_add=update"

III. Box initialization behaviour.
   1) We can initialize on clean system (where boxes were never initialized before)[defult]:
        run as in I.1)
   2) We can cleanup default box folders and remove boxes (for example from previous course):
        ansible-playbook -i hosts ansible_prepare.yml --extra-vars="ansible_become_pass=$ANSIBLE_PASSWORD box_init=cleanup"

NOTE: You can also combine this settings. For example if you want to upload new boxes from internet, update them in system's repository and cleanup previous ones, do:
        ansible-playbook -i hosts ansible_prepare.yml --extra-vars="ansible_become_pass=$ANSIBLE_PASSWORD box_src=remote box_add=update box_init=cleanup" 
 
 
