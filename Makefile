.PHONY: none

none:
	echo "Please specify a command"

deploy:
	 cap production deploy

upload-nginx-config:
	cap production puma:nginx_config