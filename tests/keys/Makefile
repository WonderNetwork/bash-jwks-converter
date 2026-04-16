EC_CURVES=prime256v1 secp521r1 secp384r1 secp256k1

.PHONY: all clean rsa ecdsa remove-private

all: rsa ecdsa remove-private jwks.json

rsa: rsa_private.pem rsa_public.pem

rsa_private.pem:
	openssl genpkey -algorithm RSA -out $@ -pkeyopt rsa_keygen_bits:2048

rsa_public.pem: rsa_private.pem
	openssl rsa -pubout -in $< -out $@

ecdsa: $(EC_CURVES:%=ecdsa_%_private.pem) \
       $(EC_CURVES:%=ecdsa_%_public.pem)

ecdsa_%_private.pem:
	openssl ecparam -name $* -genkey -noout -out $@

ecdsa_%_public.pem: ecdsa_%_private.pem
	openssl ec -in $< -pubout -out $@

remove-private:
	rm -f *_private.pem

jwks.json: node_modules
	find . -name '*.pem' -exec bash -c 'npx jose addkey --create {} | jq --arg kid {} ".keys|.[]|(.+{kid: \$kid[2:]})"' \; | jq -s '{keys:.|sort_by(.kid)}' > jwks.json

	rm -fr node_modules

node_modules:
	@npm install node-jose-tools
	@rm package.json package-lock.json

clean:
	rm -rf *.pem jwks.json
