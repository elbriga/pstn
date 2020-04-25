# vim:set ft=dockerfile:
FROM alpine:latest

MAINTAINER Gabriel Ortiz Lour <gabriel@nexcore.com.br>

RUN  mkdir -p /etc/asterisk && mkdir -p /var/lib/asterisk/moh
COPY astConfs/* /etc/asterisk/

RUN apk add --update asterisk \
	&& asterisk -U asterisk \
	&& sleep 5 \
	&& pkill -9 asterisk \
	&& pkill -9 astcanary \
	&& sleep 2 \
	&& rm -rf /var/run/asterisk/* \
	&& mkdir -p /var/spool/asterisk/fax \
	&& chown -R asterisk: /var/spool/asterisk/fax \
	&& truncate -s 0 /var/log/asterisk/messages /var/log/asterisk/queue_log \
	&& rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

EXPOSE 5060/udp 5060/tcp

ADD docker-entrypoint.sh /docker-entrypoint.sh

COPY sons/letItBe.mp3 /var/lib/asterisk/moh
COPY sons/tt-monkeys.gsm /var/lib/asterisk/sounds

ENTRYPOINT ["/docker-entrypoint.sh"]
