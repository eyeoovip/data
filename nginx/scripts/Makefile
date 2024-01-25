docker:
	@sh init_docker.sh

clear:
	@docker stop nginx
	@docker rm nginx

iserr:
	@docker run --rm nginx nginx -t

letsencrypt:
	@docker run --rm -p 80:80 -p 443:443 -v /etc/letsencrypt:/etc/letsencrypt quay.io/letsencrypt/letsencrypt auth --standalone -m 2804909967@qq.com --agree-tos -d release.runningdoctor.cn 
