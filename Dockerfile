FROM sickp/alpine-sshd
ADD run2.sh /run2.sh
RUN chmod +x /*.sh
RUN apk update && apk add sshpass

EXPOSE 1099

CMD ["sh", "/run2.sh"]
