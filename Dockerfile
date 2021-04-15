# Use an official Python runtime as a parent image
#FROM python:2.7-slim
#FROM python:3.8-slim-buster
FROM python:3.7-alpine3.12

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Installing client libraries and any other package you need
RUN apk add postgresql-dev
RUN apk add gcc
RUN apk add build-base
#RUN apk update && apk add --virtual build-deps gcc python-dev musl-dev && apk add postgresql-dev

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
