# Add Links
.PHONY: stow
stow:
	@stow -vt ~ .

# Remove links
.PHONY: clean
clean:
	@stow -vDt ~ .

# Test adding links
.PHONY: test
test:
	@stow -vnt ~ .

# Test removing links
.PHONY: test-clean
test-clean:
	@stow -vnDt ~ .
