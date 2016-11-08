.PHONY: clean help

all:
	cd opencv && make -j
rod_%: ## Compile and Run indivitual rodinia programs using make run_rodinia_name
rod_%:
	cd rodinia; make $@

test_%: ## Compile and Run indivitual test programs using make run_test_name
test_%:
	cd test; make $@

clean: ## Delete all object files
	find . -name "*.out" -type f -delete
	find . -name "*.o" -type f -delete

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
