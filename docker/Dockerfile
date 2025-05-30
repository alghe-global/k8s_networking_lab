FROM ubuntu

COPY app.py /app/

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt -y install tzdata
RUN apt install -y python3 python3-pip python3.12-venv

RUN pip3 install --break-system-packages -U flask

WORKDIR /app/

ENTRYPOINT ["/usr/local/bin/flask", "run", "--host=0.0.0.0"]
