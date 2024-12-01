Юнит работает если скрипт расположен по пути:
``` /usr/local/bin/process_monitor.sh ```

Скрипт проверяет на перезапуск файла путем записи информации о процессе в файл:
``` /var/run/monitoring ```

чтобы запустить необходимо:
1. скачать скрипт по пути:
```/usr/local/bin/process_monitor.sh ```
3. скачать юнит по пути: ```/etc/systemd/system/process_monitor.service```
4. дать права на исполнение для скрипта 
```bash
sudo chmod +x /usr/local/bin/process_monitor.sh
```
6. Активировать юнит systemd: 
```bash
sudo systemctl daemon-reload
sudo systemctl enable process_monitor.service
sudo systemctl start process_monitor.service
```
