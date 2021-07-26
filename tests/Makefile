MAMBA_FORMAT = documentation
# MAMBA_ADDITIONAL_ARGS = --enable-coverage
MAMBA_TAGS = unit
MAMBA_COMBINED_ARGS = --format $(MAMBA_FORMAT) $(MAMBA_ADDITIONAL_ARGS) $(MAMBA_ARGS)
MAMBA_CMD = poetry run mamba

TEST_MAMBA_CMD = $(MAMBA_CMD) $(MAMBA_COMBINED_ARGS) ..

# bash or zsh required for the <(...) construct
SHELL = bash

.PHONY: default
default:
	echo "Please pick an action."
	exit 1

.PHONY: test

test: test-unittest test-spec

.PHONY: test-mamba test-spec test-unittest
test-mamba test-spec:
	if [ -f test.env ]; then source ./test.env; fi; \
	export LOG_LEVEL; \
	export PYTHONPATH="$(PWD)/..:$(PWD)/../vendored:$(PWD)/../vendored-pip"; \
	$(TEST_MAMBA_CMD) $(if $(MAMBA_TAGS), --tags $(MAMBA_TAGS))

.PHONY: test_*.py

 test-unittest: test_*.py

test_*.py:
	if [ -f test.env ]; then source ./test.env; fi; \
	export LOG_LEVEL; \
	export PYTHONPATH="$(PWD)/..:$(PWD)/../vendored:$(PWD)/../vendored-pip"; \
	poetry run python3 "$@"
