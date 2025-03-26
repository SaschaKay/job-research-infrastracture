добавить в терраформ!
sudo chown -R 50000:0 /opt/docker/airflow


docker exec -it <jupyter_container_name> jupyter notebook list
jupyter notebook stop 8889 

jupyter notebook list # shows the running notebooks and their port-numbers
                      # (for instance: 8080)
lsof -n -i4TCP:[port-number] # shows PID.
kill -9 [PID] # kill the process.




VS Code замечает, что появился открытый порт Он автоматически делает порт-форвардинг:
ssh -L 8080:localhost:8080 user@vm
Теперь твой локальный браузер может обращаться к localhost:8080, и это туннель в ту самую ВМ