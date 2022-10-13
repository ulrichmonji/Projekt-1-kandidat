FROM python:3.9.4-alpine
LABEL maintainer="Romaric Yemeli"
WORKDIR /opt
# update image and install some prerequisites
RUN apk update && \
    apk add gcc musl-dev postgresql-dev bash
RUN pip install --upgrade pip    

# Cloning app     
COPY . /opt/

# Install application requirements
RUN pip install -r requirements.txt

# Expose application PORT
EXPOSE 8080

# Run application
CMD ["python","manage.py","runserver","0.0.0.0:8080"]