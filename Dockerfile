FROM librenms/librenms:latest
RUN apk add --update --no-cache openssh sshpass expect
