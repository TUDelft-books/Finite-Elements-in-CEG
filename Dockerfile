FROM python:3.11-slim-bullseye
WORKDIR /book
COPY book/ .
RUN apt-get update
RUN apt-get -y install git gcc
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN jupyter book clean .
RUN jupyter book build .
ENTRYPOINT [ "python", "-m", "http.server", "8000", "--directory", "/book/_build/html"]
