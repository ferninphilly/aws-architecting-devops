# Challenges for Module 4

1. So we would also want a variable to control the stage (dev, prod, stage). Create a variable that does this in the terraform files and make sure that the variable works.

2. Make changes to the code- add in the gif file from the **.module_04/images/troll2.gif** directory and show that when people visit the website (you'll need to do some light html there). Run through the terraform steps to redeploy.

3. Change the endpoint to only allow GET from our endpoint.

4. Create a brand new architecture diagram for an application that passes data from a kinesis stream to a lambda function for transformation which then passes to a DynamoDB instance for review and then on to an EC2 instance Elastic Block store to s3. There will also be a webserver on the ec2 instance that will use APIGateway to make the EBS data available for an API.  

5. Destroy everything we just made with terraform. 