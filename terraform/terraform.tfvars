virtual_machines = {
   "vm-1" = {
     vm_name      = "mw_server_1" # Имя ВМ
     vm_desc      = "Веб-сервер MediaWiki 1"
     vm_cpu       = 2 # Кол-во ядер процессора
     ram          = 2 # Оперативная память в ГБ
     disk         = 20 # Объём диска в ГБ
     disk_name    = "mw_server_1-disk" # Название диска
     template     = "fd82sqrj4uk9j7vlki3q" # ID образа ОС для использования
     default_user = "ubuntu"
   }
   "vm-2" = {
     vm_name      = "mw_server_2" # Имя ВМ
     vm_desc      = "Веб-сервер MediaWiki 2"
     vm_cpu       = 2 # Кол-во ядер процессора
     ram          = 2 # Оперативная память в ГБ
     disk         = 20 # Объём диска в ГБ
     disk_name    = "mw_server_2-disk" # Название диска
     template     = "fd82sqrj4uk9j7vlki3q" # ID образа ОС для использования
     default_user = "ubuntu"
   }
   "vm-3" = {
     vm_name      = "db_image_server" # Имя ВМ
     vm_desc      = "Основная БД и сервер загруженных изображений"
     vm_cpu       = 2 # Кол-во ядер процессора
     ram          = 2 # Оперативная память в ГБ
     disk         = 20 # Объём диска в ГБ
     disk_name    = "db_image_server-disk" # Название диска
     template     = "fd82sqrj4uk9j7vlki3q" # ID образа ОС для использования
     default_user = "ubuntu"
   }
   "vm-4" = {
     vm_name      = "dbreplica_server" # Имя ВМ
     vm_desc      = "Реплика БД"
     vm_cpu       = 2 # Кол-во ядер процессора
     ram          = 2 # Оперативная память в ГБ
     disk         = 20 # Объём диска в ГБ
     disk_name    = "dbreplica_server-disk" # Название диска
     template     = "fd82sqrj4uk9j7vlki3q" # ID образа ОС для использования
     default_user = "ubuntu"
   }
   "vm-5" = {
     vm_name      = "backup_zabbix_server" # Имя ВМ
     vm_desc      = "Бэкап сервер и сервер мониторинга zabbix"
     vm_cpu       = 2 # Кол-во ядер процессора
     ram          = 2 # Оперативная память в ГБ
     disk         = 20 # Объём диска в ГБ
     disk_name    = "backup_zabbix_server-disk" # Название диска
     template     = "fd82sqrj4uk9j7vlki3q" # ID образа ОС для использования
     default_user = "ubuntu"
   }
   "vm-6" = {
     vm_name      = "nginxproxy_server" # Имя ВМ
     vm_desc      = "Nginx прокси для веб-серверов MediaWiki"
     vm_cpu       = 2 # Кол-во ядер процессора
     ram          = 2 # Оперативная память в ГБ
     disk         = 20 # Объём диска в ГБ
     disk_name    = "nginxproxy_server-disk" # Название диска
     template     = "fd82sqrj4uk9j7vlki3q" # ID образа ОС для использования
     default_user = "ubuntu"
   }
}
