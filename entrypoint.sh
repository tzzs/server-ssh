#!/bin/sh

SSH_DIR=${HOME}/.ssh

mkdir -p $SSH_DIR

cat $PRIVATE_KEY >${SSH_DIR}/deploy.key
chmod 600 ${SSH_DIR}/deploy.key

cat >>${SSH_DIR}/config <<END
Host server
    HostName $INPUT_IP
    Port $INPUT_PORT
    User $INPUT_USERNAME
    IdentityFile ${SSH_DIR}/deploy.key
    StrictHostKeyChecking no
END

cat ${SSH_DIR}/config

echo "Start executing commands..."

echo ${INPUT_SHELL}

for shell in ${INPUT_SHELL}; do
    echo $shell
    ssh server $shell
done

echo "Commands execution completed."
