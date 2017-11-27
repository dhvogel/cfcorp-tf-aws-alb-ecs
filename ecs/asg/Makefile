.PHONY: \
	apply \
	clean \
	destroy \
	fmt \
	get \
	init \
	output \
	plan \
	plan_destroy \
	show \
	validate

TERRAFORM := AWS_PROFILE=DAN_PERSONAL terraform_v0.11.0

apply:
	$(TERRAFORM) get -update
	$(TERRAFORM) apply

clean:
	rm -rf .terraform

destroy:
	$(TERRAFORM) destroy

fmt:
	$(TERRAFORM) fmt

get:
	$(TERRAFORM) get

init:
	$(TERRAFORM) init \
	   -backend=true \
     -backend-config="bucket=cfcorp-prod-remotestate" \
	   -backend-config="key=/alb-ecs/ecs/asg/terraform.tfstate" \
	   -backend-config="region=us-east-1" \
	   -backend-config="encrypt=true"

output:
	$(TERRAFORM) output

plan:
	$(TERRAFORM) plan

plan_destroy:
	$(TERRAFORM) plan -destroy

show:
	$(TERRAFORM) show

validate:
	$(TERRAFORM) validate
