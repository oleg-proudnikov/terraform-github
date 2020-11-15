#/bin/bash

[[ $# -eq 0 || "$1" == "p" ]] && terraform plan -out plan.out
[[ "$1" == "a" ]] && terraform apply plan.out
