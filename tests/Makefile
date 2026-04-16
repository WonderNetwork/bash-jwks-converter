.DEFAULT_TARGET = test
.PHONY: test test-pubkey-to-jwks test-jwks-to-pubkey

BASE := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

test: test-jwks-to-pubkey test-pubkey-to-jwks

test-pubkey-to-jwks:
	@echo "Testing pubkey-to-jwks"
	@bash -c "diff -u $(BASE)/keys/jwks.json <($(BASE)/../pubkey-to-jwks keys/*.pem)"

test-jwks-to-pubkey:
	@echo "Testing jwks-to-pubkey"
	$(eval ALPHA_DIR := $(shell mktemp -d))
	$(eval BRAVO_DIR := $(shell mktemp -d))
	@cp -r "$(BASE)/keys/"*.pem "$(ALPHA_DIR)"
	@$(BASE)/../jwks-to-pubkey $(BASE)/keys/jwks.json "$(BRAVO_DIR)"
	@diff -ru "$(ALPHA_DIR)" "$(BRAVO_DIR)"
	@rm -fr "$(ALPHA_DIR)" "$(BRAVO_DIR)"

