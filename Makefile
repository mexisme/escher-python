MAMBA_FORMAT = documentation
# MAMBA_ADDITIONAL_ARGS = --enable-coverage
MAMBA_ARGS = --format $(MAMBA_FORMAT) $(MAMBA_ADDITIONAL_ARGS)
MAMBA_CMD = poetry run mamba

TEST_MAMBA_CMD = $(MAMBA_CMD) $(MAMBA_ARGS) .

# bash or zsh required for the <(...) construct
SHELL = bash

.PHONY: default
default:
	echo "Please pick an action."
	exit 1

.PHONY: build test update upgrade
build: vendored-pip

.PHONY: test-mamba test-spec test-unittest
test test-mamba test-spec test-unittest:
	cd tests; make "$@"

update upgrade: poetry-update requirements.txt

poetry-update:
	poetry update

requirments.txt: poetry.lock
	poetry export --without-hashes >$@
	#pip install -r <(poetry export --without-hashes) -t vendored-pip

poetry.lock: pyproject.toml
	poetry install
