FROM python:3.7-alpine
RUN apt-get update -y && apt-get install -y python-pip python-dev
WORKDIR .
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY .
CMD ["python","script_executor.py"]
