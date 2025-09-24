# Use an official Python runtime as a parent image
FROM python:3.11-slim
WORKDIR /app
COPY app.py ./
COPY req.txt ./
RUN pip install -r req.txt || pip install flask
EXPOSE 80
CMD ["python", "app.py"]
