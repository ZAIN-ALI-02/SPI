export CORE_ROOT=$(shell pwd)

all: icarus

icarus: icarus_compile
		vvp $(CORE_ROOT)/temp/spi_flash_master_tb.vvp

icarus_compile:
		mkdir -p temp
		iverilog -f flist -o $(CORE_ROOT)/temp/spi_flash_master_tb.vvp

clean:
		rm -rf temp


