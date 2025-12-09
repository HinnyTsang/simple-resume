RESUME_DATA_FILE := $(RESUME_DATA_FILE)
RESUME_OUTPUT_NAME := $(basename $(RESUME_DATA_FILE))

.PHONY: compile
compile:
	typst compile  --format pdf --input resume_data=$(RESUME_DATA_FILE) resume_template/basic.typ outputs/$(RESUME_OUTPUT_NAME).pdf