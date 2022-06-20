# New Relic Terraform Local Development Boilerplate
This boilerplate gets you up and running quickly with Terraform and New Relic. It includes a simple runner script that lets you easily provide credentials to Terraform without having to commit them to code.


## Installation
Make sure terraform is installed. I recommend [tfenv](https://github.com/tfutils/tfenv) for managing your terraform binaries.

Update the `runtf.sh.sample` file with your credentials and accont details and rename it `runtf.sh`. **Important do not commit this new file to git!** (It should be ignored in `.gitignore` already)

Note: You may want to update the version numbers in [main.tf](main.tf) to the latest versions of  Terraform and the New Relic provider.

## Initialisation
Use the `runtf.sh` helper script where ever you would normally run `terraform`. It simply wraps the terraform with some environment variables that make it easier to switch between projects.

First initialise terraform:
```
./runtf.sh init
```

Now apply the changes:
```
./runtf.sh apply
```

## State storage
This boiler plate does not include remote state storage. State will be stored locally.

