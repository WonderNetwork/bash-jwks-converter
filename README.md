# Convert between public keys in PEM format and jwks.json and back

## Usage

Convert jwks.json from file or URL to PEM format:

```sh
jwks-to-pubkey jwks.json pubkey-outdir/
jwks-to-pubkey https://token.actions.githubusercontent.com/.well-known/jwks
```

Convert pubkeys to jwks.json (outputs to stdout):

```sh
pubkey-to-jwks Resources/keys/*.pem
```

## System requirements

Check if you have all the required tools:

```sh
type jq openssl xxd base64 sed grep tr cut basename 
```

Optional:

```sh
type curl
```

## Out of scope

### Other key formats

There are existing tools to convert different key formats to PEM. Use these to prepare
your keys before using this tool. Similarly, the converter outputs keys in PEM format,
you can further convert them to other formats.

### Other JWKS parameters

For example, the `use` and `alg` parameters are not supported. The converter focuses
only on the public key conversion, and you can add these parameters using other tools,
for example:

```sh
pubkey-to-jwks Resources/keys/*.pem | jq '{ keys: .keys | map(. + { use: "sig" }) }'
```
