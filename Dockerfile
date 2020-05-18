FROM python:3.7-slim

WORKDIR /app

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY app ./

CMD exec gunicorn app.wsgi --bind :$PORT --workers 1 --threads 8 --timeout 0
