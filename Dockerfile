FROM python:3.7-alpine
RUN apk update
WORKDIR .
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD ["python","script_executor.py"]
