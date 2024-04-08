FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y tcl php unzip git wget

RUN wget https://github.com/KumbiaPHP/KumbiaPHP/archive/refs/tags/v1.2.0.zip && unzip v1.2.0.zip && \
    mkdir -p /PoC && mv KumbiaPHP-1.2.0/ /PoC

COPY databases.php /PoC/KumbiaPHP-1.2.0/default/app/config/databases.php
WORKDIR /PoC/KumbiaPHP-1.2.0/default/app
RUN ls /PoC/KumbiaPHP-1.2.0/default/app
CMD ["bin/phpserver"]
