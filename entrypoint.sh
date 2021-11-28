#!/bin/sh

SSH_DIR=${HOME}/.ssh

mkdir -p $SSH_DIR

cat $PRIVATE_KEY >${SSH_DIR}/deploy.key
chmod 600 ${SSH_DIR}/deploy.key

cat >>~/.ssh/config <<END
Host server
    HostName $INPUT_IP
    Port $INPUT_PORT
    User $INPUT_USERNAME
    IdentityFile ${SSH_DIR}/deploy.key
    StrictHostKeyChecking no
END

echo "Start executing commands..."

for shell in ${INPUT_SHELL}; do
    ssh server $shell
done

echo "Commands execution completed."
