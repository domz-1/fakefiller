.PHONY: all install uninstall test

all:
	@echo "Run 'make install' to install FakeFiller Linux"

install:
	@bash ./install.sh

uninstall:
	@bash ./uninstall.sh

test:
	@./bin/fakefiller email
	@./bin/fakefiller uuid
	@./bin/fakefiller ar-name
