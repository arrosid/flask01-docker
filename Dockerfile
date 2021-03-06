FROM python:3.6-alpine
MAINTAINER Ahmad Rosid Komarudin <ahmadrosid30121997@gmail.com>

ENV INSTALL_PATH /web_app
RUN mkdir -p ${INSTALL_PATH}

WORKDIR ${INSTALL_PATH}

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "web_app.app:create_app()"