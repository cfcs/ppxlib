INSTALL_ARGS := $(if $(PREFIX),--prefix $(PREFIX),)

# Default rule
default:
	jbuilder build --dev --auto-promote @cinaps @install

install:
	jbuilder install $(INSTALL_ARGS)

uninstall:
	jbuilder uninstall $(INSTALL_ARGS)

reinstall: uninstall reinstall

test:
	jbuilder runtest --dev

doc:
	cd doc && sphinx-build . _build

livedoc:
	cd doc && sphinx-autobuild . _build \
	  -p 8888 -q  --host $(shell hostname) -r '\.#.*'

clean:
	rm -rf _build

all-supported-ocaml-versions:
	jbuilder build --dev @install --workspace jbuild-workspace.dev --root .

.PHONY: default install uninstall reinstall clean test
.PHONY: all-supported-ocaml-versions
