DOCS = index help calendar zoom/index
PHDOCS = $(addsuffix .html, $(DOCS))

JEMDOC_CMD = python3 ./jemdoc.py -o $@ -c jemdoc.conf $<

.PHONY: update clean

# Update: Generate all documentation
update: $(PHDOCS)
	@echo 'Documentation updated.'

# Rule to generate HTML files in the current directory
%.html: %.jemdoc MENU jemdoc.conf
	$(JEMDOC_CMD)

# Clean up generated files
clean:
	-rm -f *.html zoom/*html