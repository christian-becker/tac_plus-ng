# tac_plus-ng
Run "tac_plus-ng", a new TACACS+ daemon, on Alpine Linux with Docker.  
This version of tac_plus-ng is a major rewrite of the original public Cisco source code and is in turn largely based on tac_plus from Marc Huber.  
It has multiple useful features, like LDAP / ActiveDirectory / RADIUS backends and rule-based permission assignment.   
Project URLs: https://www.pro-bono-publico.de/projects/tac_plus-ng.html and https://github.com/MarcJHuber/event-driven-servers/   

---

## how to use it
If you just want to use the container from docker hub, create the directories and configurations - then proceed with step 2.  

### 1.) OPTIONAL: BUILD the docker container
```
docker build -t christianbecker/tac_plus-ng .
```

---

### 2.) CONFIGURE the container - tac_plus-ng
Just copy your tac_plus-ng configuration to "etc" directory or adjust your settings in the existing file "tac_plus-ng.cfg".

---

### 3.) USE the container
Run the container with: 
```
docker run --name tac_plus-ng -p 49:49 -v $(pwd)/etc/tac_plus-ng.cfg:/usr/local/etc/tac_plus-ng.cfg -v $(pwd)/log/:/var/log/ -d -t --restart=always christianbecker/tac_plus-ng 
```


---

## project links
[GitHub](https://github.com/christian-becker/tac_plus-ng)  
[Docker Hub](https://hub.docker.com/r/christianbecker/tac_plus-ng/)


---

## Authors
* **Christian Becker** - [christian-becker](https://github.com/christian-becker)

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/christian-becker/tac_plus-ng/blob/master/LICENSE) file for details.

