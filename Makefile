IDIR =./include
CC=nvcc
CFLAGS=-I$(IDIR)

EXECUTABLES = block_2d_test.out block_iterator_test.out sub_block_test.out window_2d_test.out hotspot.out


.PHONY: run clean help

%.out: %.cu
	$(CC)  -o $@ $< $(CFLAGS)

run_hotspot_64: ## Compile and Run hotspot with 64*64 dataset
run_hotspot_64: hotspot.out
	./hotspot.out 64 2 2 temp_64	power_64 result.out
	openssl md5 result.out

run_hotspot_1024: ## Compile and Run hotspot with 1024*1024 dataset
run_hotspot_1024: hotspot.out
	./hotspot.out 1024 2 2 temp_1024	power_1024 result.out
	openssl md5 result.out

run_%: ## Compile and Run indivitual test programs using make run_test_name
run_%: %.out
	./$<

test:	block_2d_test.out
	./block_2d_test.out
all: ## Compile all listed tests and Rodinia benchmarks implementations
all: $(EXECUTABLES)

clean: ## Delete all object files
	rm -f *.out *.o

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
