.DEFAULT_TARGET = test
.PHONY: test test-pubkey-to-jwks test-jwks-to-pubkey

test: test-jwks-to-pubkey test-pubkey-to-jwks

test-pubkey-to-jwks:
	@echo "Testing pubkey-to-jwks"
	bash -c "diff -u keys/jwks.json <(../pubkey-to-jwks keys/*.pem)"

test-jwks-to-pubkey:
	@echo "Testing jwks-to-pubkey"
	$(eval ALPHA_DIR := $(shell mktemp -d))
	$(eval BRAVO_DIR := $(shell mktemp -d))
	@cp -r "$(PWD)/keys/"*.pem "$(ALPHA_DIR)"
	../jwks-to-pubkey keys/jwks.json "$(BRAVO_DIR)"
	@diff -ru "$(ALPHA_DIR)" "$(BRAVO_DIR)"
	@rm -fr "$(ALPHA_DIR)" "$(BRAVO_DIR)"

