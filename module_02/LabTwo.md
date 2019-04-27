# Lab Two: Creating our first resources with Terraform

So now that we have our local development environment set up within (and without) of our docker container we are ready to start creating aws assets using terraform. 

### Set up terraform directory structure

First step is to go into the **./app** folder and add in a **./terraform** directory: `mkdir terraform`.
When setting up for an aws application it is advisable that you keep your **terraform** files separate from your application (code) files. Terraform, if you recall from the lecture portion, __appends__ all of the terraform files in a directory together (except for __overwrite__ files which are merged). You don't want code interfering with that!

Next step is to create the three files in the terraform directory: **variables.tf**, **main.tf**, **outputs.tf** and we're going to add another one for later: **template.tf**. So make these directories (on linux/unix just **touch** them. In windows...do the windows thing that creates files)

### Creating the first terraform file

In the `main.tf` file the first section we are going to create is the **provider** setion. As we're using aws for this course the parameters for this section should be pretty obvious:

```
provider "aws" {
  access_key = "ACCESS_KEY_HERE"
  secret_key = "SECRET_KEY_HERE"
  region     = "eu-west-1"
}
```

So now we come to a minor issue: __we don't want to commit our access keys to git__. Obviously this would be a security issue...so from here we have several options:

* We can utilize the __~./aws/credentials__ file profiles on our local host machine
* We can utilize the AWS environment variables on our host machine
* We can simply put all of our key variables into our var file and not commit **variables.tf**


The advantage here is that we can commit a tf file that simply maps to the credentials on the host machine. SO- terraform will use the **default** profile by default... but if you have multiple profiles that look like this:

```
[default]
aws_access_key_id=<access_key>
aws_secret_access_key=<secret_access_key>

[wiseau]
aws_access_key_id=<access_key>
aws_secret_access_key=<secret_access_key>
```

Then you can do this:

```
provider "aws" {
  profile    = "wiseau"
  region     = "eu-west-1"
}
```

For option **TWO** (which we will be utilizing because it makes things harder but also allows us to utilize more of terraform's functions) we will be importing environment variables into our terraform files by utilizing the **AWS_ACCESS_KEY_ID** environment variables name. Remember that we want to pass our credentials into our docker environment. To do that we use the `-e` flag so our build and run commands look like this:

`docker build -t terraform .`
`docker run -ti --rm --name terraformcontainer -v /Users/fernandopombeiro/github_projects/aws-architecting-devops/app:/app -e AWS_ACCESS_KEY_ID=<accessKey> -e AWS_SECRET_ACCESS_KEY=<secretKey> <ContainerID> /bin/bash`

So if you follow what we did there- the above command should get us into the docker container. Now let's check from within the container that the environment variables were successfully passed with the following command:
`echo $AWS_ACCESS_KEY_ID`. Do you see the access key? congrats! 

We're ready to go now! Edit your **main.tf** file so that you totally get rid of everything but the region. It should now look like this:

```
provider "aws" {
  region     = "${var.region}"
}
```

Obviously we're going to have to define that region variable...so let's go into our **variables.tf** file and put in the following:

```
variable "region" {
    type = "string"
    description = "This is the region we want to deploy to. If you want to change the region do it here"
    default = "eu-west-1"
}
```

This should make sense based on the lecture portion.

Now we're ready to move on to creating resources. Let's start with an EC2 instance!

### Creating our first ec2 instance

We're going to start with an EC2 instance (in my experience these are the most common resources we provision __except for__ lambda resources...which we'll get to later). Recall from the lectures how we provision resources. We're going to start with a very basic image:

```
resource "aws_instance" "mark" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}
```

The **t2.micro** is used to keep everything in the free tier. The **ami** type can be found [here](https://cloud-images.ubuntu.com/locator/ec2/)..but spoiler: we're going with a basic ubuntu image.

So now your **main.tf** file should look like this:

```
provider "aws" {
  region     = "${var.region}"
}

resource "aws_instance" "mark" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}
```
Now we're ready to go. Let's **initialize**, **plan** and **apply** the terraform to get this ec2 instance deployed:

### Terraform init, plan, apply

So from within your container navigate to your **terraform** directory (`cd ./terraform` assuming you mounted the **app** directory).
Okay- so the first step from within this file (check that you are next to **main.tf** with a quick `ls`) run the following command: `terraform init`

Did it work? 

This is the point where terraform will download the appropriate plugins (now that it knows that you are using **aws**) and create a hidden **.terraform** directory that contains the downloaded plugins. If you received a message that looks like this then you have successfully initialized your terraform directory. It's worth saying this again: **keep these directories separate from application logic**

![terraforminit](./images/terraforminit.png)

So that is the __init__ step. 
Let's get on to the __plan__ step! 
At a simple level let's add in a __plan__ here to see what the new resource is going to look for. Whilst still in the same directory as your terraform files run a `terraform plan`. You should see something that has a `+create` at the beginning (in green maybe(?)) and a `+aws_instance.mark`. 
Now- this might blow your mind but the "+" sign means that we are __adding__ a resource (and it's green)....so if you had to guess- what would the __destroy__ markings look like?
Now that you have the plan ready (basically summarizing what's going to change) you can __apply__ the changes by going into the command line and typing in `terraform apply`

Now let's look at the plan: **1 to add, 0 to change, 0 to destroy**.
Do you want to perform these actions? 
Type in `yes`


**It is possible that you received an error that said that you do not have permissions to create this resource. I am not going to put the answer in here because you guys have the power to get this one done**

![leroy](./images/leroy.jpeg)

If we need to...let's take five to get this last problem solved. It is the next challenge in this lab.

Once you have completed this we need to make sure that our resource has been created. Let's head back to our aws management console and make sure that we can see the ec2 instance that we created (they will show up in our **default** vpc by, uh, default). **Don't forget about the region** (which you can change in the top right hand corner).

![ec2prove](./images/proveec2.png)

You should see the ec2 instance now in existence. **Congratulations!** we have deployed a resource. 
Now let's get some information about that resource!
Type: `terraform show` into the command line. Check out the information there (including the public IP address). This can be useful (but could it be even MORE useful with OUTPUT variables??)

### Updating a resource:
Now let's update our resource accordingly. Let's change the ami type of our ec2 instance (named **mark**) to **ami-b374d5a5**:

```
resource "aws_instance" "mark" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}
```

So now the resource is changing from **Ubuntu 16.04** to an updated **Ubuntu 16.10**. Simply make the changes to the **main.tf** file and type `terraform plan`. Take a look at the plan. Do you see the tilda? ` ~ aws_instance.mark`.
Notice that it's now YELLOW and removing the tags and the NAME. 
If you are satisfie with all of these proposed changes go ahead and type in `terraform apply`.
You should end up with `0 added, 1 changed, 0 destroyed` in the resources message. Now head back and make sure that your ec2 instance has been updated! (PLEASE NOTE: TAGS are what the NAME maps to in the PROVIDER object in terraform)

### Deleting a resource:
Our final exercise here will be to **delete** a resource with terraform.
We do this (conveniently enough) with the **destroy** keyword in terraform:
`terraform destroy`

This should take down the resources created.


