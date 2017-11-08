# knopa_master

Управление аудиторией осуществляется из ВМ knopa_master, которая находится на преподавательском компьютере в директории D:\DevOps\knopa_master.  
ВМ управляется с помощью Vagrant. Конфигурация ВМ в виде Vagrantfile хранится в репозитории https://github.com/petrenkoas83/knopa_master.  
На ВМ knopa_master установлен Ansible. Подробности конфигурации можно помотреть в Vagrantfile в разделе provisioning.  
Для создания и запуска ВМ knopa_maser нужно выполнить команды:  
    $ git clone https://github.com/petrenkoas83/knopa_master  
    $ cd knopa_master  
    knopa_master$ vagrant up  

Для входа в ВМ нужно выполнить команду:  
    knopa_master$ vagrant ssh  
  
# Доступы

На всех компьютерах учебного класса создан пользователь DevOps со стандартным паролем. Пароль для группы хостов knopa захардкодил в hosts-файл.  
Запуск ВМ проихсодит не в интерактивной сесии пользователя. Поэтому использовать команду vagrant ssh для входа в ВМ невозможно.  
Доступ к ВМ на базе ОС Linux осуществлется по ssh-протоколу с помощью клиента Putty.  
Доступ к ВМ на базе ОС Windows осуществляется по WinRM- или RDP- протоколам.  

## Доступ к ВМ курса Ansible

Логин и пароль на всех ВМ vagrant:vagrant.  
IP-адреса ВМ по умолчанию:
* 192.168.33.101 master
* 192.168.33.102 nix_slave 
* 192.168.33.103 win_slave

## Доступ к ВМ курсов Git, Jenkins, Sonarqube

Логин на ВМ ubunt, **пароль нужно уточнить**.  
IP-адреса ВМ по умолчанию:
* 192.168.33.104 BbJeNeS

# Распространение и подготовка ВМ на компьютеры в классе

Все настройки осущесвляются из ВМ knopa_master. Репозиторий prepare_courses клонируется в домашнюю директорию пользовтеля ubuntu.  
Для подготовки ВМ для курса Ansible нужно использовать ansible_prepare_win.yml.  
Для подготовки ВМ для курсов Git, Jenkins, Sonarqube нужно использовать gjs_prepare_win.yml.  

## Запуск плейбука
Для того, чтобы выполнить все задачи и роли плейбука достаточно просто выполнить:  
    ansible-playbook -i hosts [playbook_file.yml]  

В этом случае будут выполнены следующие действия:
* произведена установка и настройка ПО Putty, Vagrant, Virtualbox;
* скопированы и установлены образы курса;
* запущены ВМ средствами vagrant.

## Запуск отдельных команд

**Ad-hoc больше нет.**  
Если установка ПО и копирование образов не требуется, можно сразу запустить или удалить образы с помощью тэгов:  
    ansible-playbook -i hosts [playbook_file.yml] --tags="init_boxes, config_boxes, up"  
    ansible-playbook -i hosts [playbook_file.yml] --tags="destroy" --extra-vars="destroy=true"  

*destroy* еще нужно проверить. И вообще, из-за нехватки времени все поехало в ПРОМ недотестированным.  
 
