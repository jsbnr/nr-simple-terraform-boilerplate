# Very Simple Terraform Bioilerplate
This boilerplate gets you up and runnign quickly. 


## Installation
Make sure terraform is installed. I recommend [tfenv](https://github.com/tfutils/tfenv) for managing your terraform binaries.

Update the `runtf.sh.sample` file with your credentials and accont details and rename it `runtf.sh`. Impportant do not commit this new file to git! (It should be ignored in `.gitignore` already)


## Initialisation
Use the `runtf.sh` helper script whereever you would normally run `terraform`. It simply wraps the terraform with some environment variables that make it easier to switch between projects.

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

