FROM python:3.9.0-alpine3.12 AS base

RUN apk add --update python3-dev build-base 
RUN pip3 install --upgrade pip
RUN pip install mkdocs-material==6.1.0

# This command ensures that the container continues running when started
CMD tail -f /dev/null
