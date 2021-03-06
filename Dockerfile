FROM repostnetwork/deploy-utils:latest

LABEL "com.github.actions.name"="AWS ECS Deploy"
LABEL "com.github.actions.description"="Deploy to ECS"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="red"

ENV AWS_REGION "us-east-1"
ENV PORT "8080"
ENV CONTAINER_COUNT "1"
ENV AUTOSCALING_MIN_CAPACITY "1"
ENV AUTOSCALING_MAX_CAPACITY "8"
ENV CPU "256"
ENV MEMORY "512"

COPY terraform /usr/src/terraform
COPY Makefile /usr/src
COPY deploy.sh /usr/local/bin/deploy

WORKDIR /usr/src

ENTRYPOINT [ "deploy" ]
