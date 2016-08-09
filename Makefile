IDIR =./include
RODINIADIR = ./rodinia
CC=nvcc
CFLAGS=-I$(IDIR)

EXECUTABLES = block_2d_test.out block_iterator_test.out sub_block_test.out window_2d_test.out


.PHONY: run clean help

%.out: %.cu
	$(CC)  -o $@ $< $(CFLAGS)

run_hotspot_64: ## Compile and Run hotspot with 64*64 dataset
run_hotspot_64: $(RODINIADIR)/hotspot/hotspot.out
	$(RODINIADIR)/hotspot/hotspot.out 64 2 2 $(RODINIADIR)/hotspot/temp_64	$(RODINIADIR)/hotspot/power_64 $(RODINIADIR)/hotspot/result.out
	openssl md5 $(RODINIADIR)/hotspot/result.out

run_hotspot_1024: ## Compile and Run hotspot with 1024*1024 dataset
run_hotspot_1024: $(RODINIADIR)/hotspot/hotspot.out
	$(RODINIADIR)/hotspot/hotspot.out 1024 2 2 $(RODINIADIR)/hotspot/temp_1024	$(RODINIADIR)/hotspot/power_1024 $(RODINIADIR)/hotspot/result.out
	openssl md5 $(RODINIADIR)/hotspot/result.out

run_%: ## Compile and Run indivitual test programs using make run_test_name
run_%: %.out
	./$<

test:	block_2d_test.out
	./block_2d_test.out
all: ## Compile all listed tests and Rodinia benchmarks implementations
all: $(EXECUTABLES)

clean: ## Delete all object files
	find . -name "*.out" -type f -delete

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
