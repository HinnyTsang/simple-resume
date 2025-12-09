# Simple Typst Resume Template

A mimimal template of the resume.

<p align="center">

<img src="./assets/example.png" width="50%">

</p>

## Usage

You may provide your resume data in JSON format and directly compile the resume using Typst.

The JSON schema is defined in [resume-schema.json](resume_template/resume-schema.json), you may start with the example data in [example.json](resume_template/example.json).

To compile the resume with your own JSON data file, run:

```console
~$ make compile RESUME_DATA_FILE=<input_json>.json
```

You may adjust the template file in [resume_template/resume.typ](resume_template/resume.typ) as needed.

## Preview in VSCode

### Tinymist Extension

You may preview the resume in VSCode by specifying the input JSON file in the workspace settings.
Add the following to `.vscode/settings.json`:

```json
{
    "tinymist.typstExtraArgs": [
        "--input=resume_data=<input_json>.json"
    ]
}
```
