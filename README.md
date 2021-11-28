# server-ssh

This action could connect your self-server and execute commands and script on it via SSH.

## Prerequisites

- This action requires your own server SSH `PRIVATE_KEY`, `IP`, `PORT` and `USERNAME` corresponding to the PRIVATE_KEY.

## Usage

### Step 1: Set up your workflow.yml File

The **SHELL** parameter in **_with_** is the command that needs to be executed on your own server.

```yaml
steps:
  - uses: actions/checkout@v2
  - uses: tzzs/server-ssh@main
    with:
      PRIVATE_KEY: ${{ secrets.PRIVATE_KEY}}
      USERNAME: ${{secrets.USERNAME}}
      IP: ${{secrets.IP}}
      PORT: ${{secrets.PORT}}
      SHELL: |
        "echo action-test"
        "ls"
```

### Step 2: Add repository secrets in the repository Settings/Secrets

Add the following parameters to secrets:

`PRIVATE_KEY`, `IP`,`SHELL(optional default:22)`,`USERNAME`

## Input

The following parameters (some optional) need to be configured in workflow.

1. `PRIVATE_KEY` [required]

   This is from the `~/.ssh/id_rsa` file.

2. `IP` [required]

   ```
   eg: 127.0.0.1
   ```

3. `PORT` [optional, default: 22]

   ```
   eg: 22
   ```

4. `USERNAME` [required]

   ```
   eg: root
   ```

5. `SHELL` (optional), use the `| ` symbol to add multiple commands

   ```shell
   SHELL: |
      "echo action-test"
      "ls"
   ```

## Output

The result of each command is printed in the action console.

## Disclaimer

Protect your private key and use at your own risk.
