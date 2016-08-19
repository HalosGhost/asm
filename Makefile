PROJECTS = true false hw concatenate-files echo repeat
ASM ?= nasm
FMT ?= elf64
LNK ?= ld

all:
	@mkdir -p build
	@for i in $(PROJECTS); do \
		$(ASM) -f$(FMT) src/$$i.asm -o build/$$i.o; \
		$(LNK) -o build/$$i build/$$i.o; \
	done

clean:
	@rm -rf -- ./build

