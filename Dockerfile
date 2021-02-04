FROM ubuntu:18.04
FROM python:3
RUN apt-get update -y && apt-get install -y python-pip python-dev
RUN apt-get update && \
      apt-get -y install sudo
WORKDIR .
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD ["python","script_executor.py"]
