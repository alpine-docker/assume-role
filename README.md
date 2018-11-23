# aws assume role

A small golang tool to assume role, simplify for using by CI/CD pipeline

Reference: https://github.com/remind101/assume-role/blob/master/main.go

Need below environment variables set in CI/CD pipeline jobs
- AWS_ACCESS_KEY_ID 
- AWS_SECRET_ACCESS_KEY

Don't care MFA token setting, since we can't stop to wait for MFA when run the bulids.

### Repo:

https://github.com/alpine-docker/assume-role

### Daily build logs:

https://travis-ci.org/alpine-docker/assume-role

### Docker iamge tags:

https://hub.docker.com/r/alpine/assume-role/tags/

# Usage:

    # mount home directory in in container.
    docker run -ti --rm -v ${HOME}:/root alpine/assume-role ${AWS_ACCOUNT_ID} ${ASSUME_ROLE}


A new file ~/.aws/credentials will be created locally.

[default]
region = XXXX
aws_secret_access_key = XXX
aws_access_key_id = XXX

# Why use it

Mostly it is used during CI/CD (continuous integration and continuous delivery) or as part of an automated build/deployment
