FROM node:16.19.0-alpine3.16

RUN mkdir /app
WORKDIR /app

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

COPY README.md README.md
RUN chmod +x README.md

ENTRYPOINT ["./entrypoint.sh"]