PROJECTS = true false hw concatenate-files echo repeat
ASM ?= nasm
FMT ?= elf64
LNK ?= ld

.PHONY: all release build link strip clean

all: link

release: strip
	@for i in $(PROJECTS); do \
		rm -f -- ./dist/*.o; \
	done

dist:
	@mkdir -p dist

build: dist
	@for i in $(PROJECTS); do \
		$(ASM) -f$(FMT) src/$$i.asm -o dist/$$i.o; \
	done

link: build
	@for i in $(PROJECTS); do \
		$(LNK) -o dist/$$i dist/$$i.o; \
	done

strip: link
	@for i in $(PROJECTS); do \
		strip ./dist/$$i; \
	done

clean:
	@rm -rf -- ./dist

