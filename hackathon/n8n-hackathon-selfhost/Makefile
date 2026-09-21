.PHONY: init plan up status logs push-scripts rebuild reset reset-all down

TF = terraform -chdir=terraform

init:            ## one-time: download providers
	$(TF) init

plan:
	$(TF) plan

up:              ## create EC2 + DNS, bootstrap 10 empty n8n instances
	$(TF) apply

status:          ## container health on the host
	scripts/ssm.sh 'docker compose ps'

logs:            ## bootstrap log (Docker install, image pull, cert issuance)
	scripts/ssm.sh 'tail -n 60 /var/log/n8n-bootstrap.log'

push-scripts:    ## copy local scripts/*.sh to the host without rebuilding it
	scripts/push-scripts.sh

rebuild:         ## destroy + recreate the EC2 host from scratch (fresh bootstrap, all team data lost)
	$(TF) apply -replace=aws_instance.n8n

reset:           ## wipe one team back to the owner setup screen: make reset TEAM=lion
	scripts/ssm.sh "./scripts/reset-team.sh $(TEAM)"

reset-all:       ## wipe ALL teams back to the owner setup screen (keeps host + certs)
	scripts/ssm.sh './scripts/reset-all.sh --yes'

down:            ## destroy everything (EC2, EIP, DNS records)
	$(TF) destroy
