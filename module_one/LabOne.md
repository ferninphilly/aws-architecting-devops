# Lab ONE: Setting up to use AWS CLI Locally

## Setting up the AWS CLI on your local machine

So in this module we'll be setting up our local computers to utilize the AWS cli. 
There are a few requirements that we'll need for the class:

1. You'll need to have Python (preferably Python3) installed on your computer and accessible from the command line. You can do that via homebrew, chocolatey, or whatever package manager you'd prefer.

2. I prefer working in bash so if you have a windows machine then HOPEFULLY it's got windows 10 where you can get a bash shell going.

There are a few minor issues to note here so let's walk through it:

### SETUP FOR MAC

Personally, on Mac OS, I prefer utilizing [homebrew](https://brew.sh/) to do package management. If you don't have homebrew it's worth getting (you can install it from the link above).

#### Install Python3:

Homebrew: `brew install python`
Verify: `python3` should launch an interpreter
Verify PIP: `pip --version`
Install pyenv (for our environment): `pip install virtualenv`
Verify pyenv: `virtualenv --version`
And one last thing just to make it easier for us (so we don't need to remember to start the environment every time): `brew install autoenv`

#### Install the AWS CLI

So a few ways to do this. Choose either of these: 

1. Homebrew: `brew install awscli`
2. Python: `pip3 install awscli --upgrade --user`

Once everything is installed check if you have successfully installed the aws command line interface by typing this into the command line: `aws --version`. If it returns something then you've successfully installed the cli. 

#### Install Terraform

1. Homebrew: `brew install terraform`

Verify with: `terraform version`


