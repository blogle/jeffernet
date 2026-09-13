set shell := ["bash", "-cu"]

fmt:
	tofu fmt

fmt-check:
	tofu fmt -check

validate:
	tofu init -backend=false
	tofu validate

plan:
	tofu plan

apply:
	tofu apply
