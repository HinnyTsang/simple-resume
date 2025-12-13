

.PHONY: example
example:
	@typst compile --format png ./resume_template/cover-letter-example.typ assets/example-cv.png
	@typst compile --format png ./resume_template/resume-example.typ assets/example.png  