## Challenges for Module One

1. Pull a __node.js__ docker container from the docker repository using the command line (hint: search google for `docker node` and then `docker pull` that container)

2. Create a file in called `./app/challengeone.js` with the following contents:

```
const name = () => console.log(`This is totally an attempt at challenge one for ${process.env.YOURNAME}`)
name()
```
3. `process.env.YOURNAME` is how node accesses environment variables. Considering this- pass an environment variable in to the docker container with YOURNAME when you run it

4. Run the node.js container and name it **chalone**. Mount the app folder on it. Remember the `-ti` and `--rm` commands. You will need to add this command to the end: `node /app/challengeone.js` 

## Create a policy and user

5. Create a user called "challenge ONE" in the aws console and attach them to a group called "practiceusers". 

6. Create a policy that allows READ from DYNAMODB and LAMBDA EXECUTE. Attach that policy to the group.

7. Copy the IAM for the user and paste it somewhere. We'll come back to it later.
