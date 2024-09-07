#! /usr/bin/env bash

set -Eeuo pipefail

fd index.md \
	--exec pandoc {} \
	-f markdown-auto_identifiers \
	-M document-css=false \
	-H ./head.html \
	-B ./return.html \
	-A ./return.html \
	-o '{.}'.html &&
	pandoc index-0.md \
		-f markdown-auto_identifiers \
		-M document-css=false \
		-H ./head-0.html \
		-o index.html &&
	prettier --write .
