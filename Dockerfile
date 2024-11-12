FROM nginx

RUN apt update && apt upgrade -y
RUN apt install -y python3 pip
RUN python3 -m pip install flask flask_socketio --break-system-packages

RUN mkdir /app

COPY ./nginx.conf /etc/nginx/
COPY ./proxy_params /etc/nginx/
COPY ./main.py /app/
RUN mkdir /app/templates
COPY ./index.html /app/templates/

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
