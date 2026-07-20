

build-yocto-builder:
	docker build -t yocto-builder .


run-yocto-builder:
	docker run --rm -it \
		-v $(PWD):/home/dumi_developer/yocto-work \
		yocto-builder

run-interactive-yocto-builder:
	docker run -it \
		-v $(PWD):/home/dumi_developer/yocto-work \
		yocto-builder /bin/bash