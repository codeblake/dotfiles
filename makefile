# Link files/directories
.PHONY: stow
stow:
	stow -vt ~ .

# Dry run
.PHONY: test
test:
	stow -vnt ~ .

# Remove links
.PHONY: clean
clean:
	stow -vDt ~ .
