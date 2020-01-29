FROM python:3.8-alpine

LABEL "com.github.actions.name"="OAS Sink"
LABEL "com.github.actions.description"="Synchronize OAS file to AWS S3"
LABEL "com.github.actions.icon"="log-in"
LABEL "com.github.actions.color"="blue"

LABEL version="0.0.1"
LABEL repository="https://github.com/kitabisa/oas-sink-action"
LABEL homepage="https://kitabisa.github.io"
LABEL maintainer="Bherly Novrandy <pushm0v.development@gmail.com>"

# https://github.com/aws/aws-cli/blob/master/CHANGELOG.rst
ENV AWSCLI_VERSION='1.17.9'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]