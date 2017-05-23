.PHONY: shared non_shared opencv

all: shared non_shared opencv

shared:
	cd shared && make clean && make -j
non_shared:
	cd non_shared && make clean && make -j

opencv :
	cd opencv && make clean && make -j
