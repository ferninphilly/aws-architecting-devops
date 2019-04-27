## Challenges to Module Two:

1. Alter the terraform application that we've built so far to read from variables in the **variables** file for the **ami-type** and the **instance-type**. Make these variables a list of possible answers and deploy them.

2. Create an output that shows the ec2 instance public IP address upon terraform apply.

3. Now that you have created your ec2 instance create a .sh file in the **./app** directory that will run on creation to `apt-get update && apt-get upgrade && echo "Oh Hai Mark!"` upon creation of the resource. Use provisioner to do this.

4. Do the same thing as in number three but use remote-exec.

5. Use `local-exec` to issue a statement locally using terraform that writes the IP address of your ec2 instance to your local machine.

6. Create a variable that reads your **ssh public key** into a terraform var (using **file** in the variables.tf file). Echo this out using a `local-exec` onto your command line. **do not delete this variable**

7. Add provisioners to add in python packages to your newly created resource. 

8. Instantiate a terraform resource in the region **eu-west-1** by using the environment variable `TF_VAR_region=eu-west-1`