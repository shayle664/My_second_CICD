FROM python:3.14.0b2-alpine3.22
WORKDIR /app
RUN pip install flask
COPY app/app.py .
EXPOSE 5002
CMD ["python","app.py"]
