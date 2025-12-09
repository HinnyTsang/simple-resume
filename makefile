RESUME_DATA_FILE := $(RESUME_DATA_FILE)
RESUME_OUTPUT_NAME := $(basename $(notdir $(RESUME_DATA_FILE)))
COVER_DATA_FILE := $(COVER_DATA_FILE)
COVER_OUTPUT_NAME := $(basename $(notdir $(COVER_DATA_FILE)))

.PHONY: resume
resume:
	typst compile  --format pdf --input resume_data=$(RESUME_DATA_FILE) resume_template/resume.typ outputs/$(RESUME_OUTPUT_NAME).pdf

.PHONY: cover
cover:
	typst compile  --format pdf --input resume_data=$(RESUME_DATA_FILE) --input cover_data=$(COVER_DATA_FILE) resume_template/cover-letter.typ outputs/$(COVER_OUTPUT_NAME)_${RESUME_OUTPUT_NAME}.pdf