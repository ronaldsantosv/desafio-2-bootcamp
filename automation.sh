#!/bin/bash

mkdir -p tempdir/templates tempdir/static;

cp -r  static/ tempdir/;

cp -r templates/ tempdir/;

cp desafio2_app.py tempdir/;

touch tempdir/Dockerfile;

echo FROM python >> Dockerfile
echo RUN pip install flask >> Dockerfile
echo COPY ./static /home/myapp/static/ >> Dockerfile
echo COPY ./templates /home/myapp/templates/ >> Dockerfile
echo COPY desafio2_app.py /home/myapp/ >> Dockerfile
echo EXPOSE 5050 >> Dockerfile
echo CMD python3 /home/myapp/desafio2_app.py >> Dockerfile

docker build -t desafio2_app;

docker run -t -d -p 5050:5050 --desafio2_app desafio2_app desafio2_app;

docker ps -a;
