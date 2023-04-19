## How to create my own image
- [ ] OS Ubuntu
- [ ] Update apt repo
- [ ] isntall dependecies 
- [ ] using apt
- [ ] install python dependecies using pip
- [ ] copy source code to /apt folder
- [ ] run the web server  using "flask" command

```Dockerfile
FROM Ubuntu
RUN apt-get update
RUN apt-get install python

RUN pip install flask
RUN pip istall flask-mysql

COPY . /opt/source-code

ENTRYPOINT FLASK_APP=/opt/source-code/app.py flask run
```

> docker build Dockerfile -t path_to_tile

> docker push docker_repository


```Dockerfile
FROM Ubuntu    start from a base OS or anotrhe image 
RUN apt-get update
RUN apt-get install python
                          Install all dependecies
RUN pip install flask
RUN pip istall flask-mysql

COPY . /opt/source-code #Copy source code

ENTRYPOINT FLASK_APP=/opt/source-code/app.py flask run  # specify entrypoint 
```


