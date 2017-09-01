#!/bin/bash

ansible -i hosts all -m shell -a "true" -u devops --become-user=devops | grep SUCCESS | cut -d'|' -f1
