FROM alpine:latest

LABEL maintainer "Dean Camera <http://www.fourwalledcubicle.com>"

RUN mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /data && \
	apk add --no-cache bash aria2 darkhttpd

RUN	apk add --no-cache git && \
	git clone https://github.com/ziahamza/webui-aria2 /aria2-webui && \
	apk del git

ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf

RUN chmod +x /conf-copy/start.sh

WORKDIR /

VOLUME ["/data"]
VOLUME ["/conf"]

EXPOSE 6800
EXPOSE 80

CMD ["/conf-copy/start.sh"]
