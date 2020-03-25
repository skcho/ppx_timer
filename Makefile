.PHONY: all install uninstall test clean

all:
	dune build

install:
	dune install ppx_timer

uninstall:
	dune uninstall ppx_timer

test:
	dune runtest

clean:
	dune clean
