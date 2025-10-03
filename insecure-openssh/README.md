## About

Custom Docker images for generating insecure SSH keys.
**For testing purposes only — not for production use.**

Used to generate insecure SSH RSA private/public key pairs for testing. Use `insecure-openssh:6.6` to generate the insecure keys.

## Quick Start

For experienced users, here's the complete workflow:

```shell
cd insecure-openssh
docker build --tag insecure-openssh:6.6 --file insecure-openssh-66.dockerfile .
mkdir -p /tmp/insecure-openssh-home && chmod 777 /tmp/insecure-openssh-home
docker run -it --rm --volume /tmp/insecure-openssh-home:/home/docker insecure-openssh:6.6 /bin/bash
# Inside container: run ssh-keygen -t rsa -b 1024, then exit
# Keys will be in /tmp/insecure-openssh-home/.ssh/
```

## Why This Image Exists

Modern OpenSSH versions (7.8+) use more secure key generation algorithms that create strong keys. For security testing scenarios where you need **intentionally weak keys** with predictable entropy, this image uses older OpenSSH versions that generate insecure keys suitable for:

- Security testing and demonstrations
- Reproducing specific vulnerabilities
- Educational purposes

## Available Versions

| Version | OpenSSH Version | Use Case |
|---------|----------------|----------|
| 6.6 | OpenSSH 6.6p1 | Generate insecure RSA keys (recommended) |
| 7.1 | OpenSSH 7.1p1 | Alternative version for compatibility testing |
| 7.2 | OpenSSH 7.2p1 | Alternative version for compatibility testing |

## Prerequisites

- Docker installed on your machine
- Basic familiarity with Docker commands
- Terminal/command line access

## Steps to Build the Image

Navigate to the `insecure-openssh` directory from the repository root and build the image:

```shell
# If you're in the repository root
cd insecure-openssh

# Or use the full path
cd /path/to/custom-docker-images/insecure-openssh

# Build the image
docker build --tag insecure-openssh:6.6 --progress=plain --platform linux/amd64 --file insecure-openssh-{VERSION}.dockerfile .
```

> [!IMPORTANT]
> Remember to change `{VERSION}` to the version you want to build. Available versions are `66`, `71`, and `72`.

## Verify the Build

Confirm the image was created successfully:

```shell
docker images | grep insecure-openssh
```

You should see output like:

```
insecure-openssh   6.6    abc123def456   2 minutes ago   XXX MB
```

## Steps to Run the Image

1. Create a directory in your machine that will act as the volume for the container's `docker` user (and grant it the right privileges):

    ```shell
    # Example: Create a temporary directory for the container's home
    mkdir -p /tmp/insecure-openssh-home
    chmod 777 /tmp/insecure-openssh-home
    ```

    > [!NOTE]
    > The `chmod 777` grants full permissions so the container's `docker` user can create the `.ssh` directory and write key files. This is safe for testing purposes on a temporary directory.

1. Mount image as a container:

    Replace `/tmp/insecure-openssh-home` with the directory you created in step 1.

    ```shell
    docker run \
            --interactive \
            --tty \
            --rm \
            --name insecure-openssh \
            --volume /tmp/insecure-openssh-home:/home/docker \
            insecure-openssh:6.6 /bin/bash
    ```

1. Generate insecure public/private key pair from within the container:

    ```shell
    ssh-keygen -t rsa -b 1024
    ```

    ```shell
    docker@a27e55c420c3:~$ ssh-keygen -t rsa -b 1024
    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/docker/.ssh/id_rsa): 
    Created directory '/home/docker/.ssh'.
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /home/docker/.ssh/id_rsa.
    Your public key has been saved in /home/docker/.ssh/id_rsa.pub.
    The key fingerprint is:
    27:3b:ae:40:8e:d8:81:83:49:7d:87:39:53:99:91:d8 docker@a27e55c420c3
    The key's randomart image is:
    +--[ RSA 1024]----+
    |      oo=        |
    |  .  .+E         |
    | . . * .         |
    |oo  . +          |
    |= . .   S .      |
    | + =     +       |
    |. o o   o        |
    |     . . .       |
    |      ...        |
    +-----------------+
    ```

    Generated key would be marked as insecure:

    ```shell
    ssh-keygen -lf <PATH_TO_PUBLIC_KEY>
    ```

    ```shell
    11024 27:3b:ae:40:8e:d8:81:83:49:7d:87:39:53:99:91:d8  docker@a27e55c420c3 (RSA)
    ```

## Exit the Container

When you're done generating keys, exit the container:

```shell
exit
```

Or press `Ctrl+D`.

## Access Your Generated Keys

The generated keys are saved in your host machine at:

```
<LOCAL_HOME_DIRECTORY>/.ssh/id_rsa       # Private key
<LOCAL_HOME_DIRECTORY>/.ssh/id_rsa.pub   # Public key
```

For example, if you used `/tmp/insecure-openssh-home`, your keys are at:

- `/tmp/insecure-openssh-home/.ssh/id_rsa`
- `/tmp/insecure-openssh-home/.ssh/id_rsa.pub`

## Cleanup

When you're finished with the keys and no longer need them:

```shell
# Remove the temporary directory and keys
rm -rf /tmp/insecure-openssh-home

# Optional: Remove the Docker image
docker rmi insecure-openssh:6.6
```

> [!WARNING]
> Remember: These keys are intentionally insecure and should only be used for testing purposes. Delete them when done.

## Example Workflow

Here's a complete example of generating insecure keys:

```shell
# 1. Build and verify
cd insecure-openssh
docker build --tag insecure-openssh:6.6 --file insecure-openssh-66.dockerfile .

# 2. Setup and run
mkdir -p ~/test-keys && chmod 777 ~/test-keys
docker run -it --rm -v ~/test-keys:/home/docker insecure-openssh:6.6 /bin/bash

# 3. Inside container: Generate key (press Enter for all prompts)
ssh-keygen -t rsa -b 1024

# 4. Verify it's insecure
ssh-keygen -lf ~/.ssh/id_rsa.pub

# 5. Exit
exit

# 6. Keys are now on your host
ls -la ~/test-keys/.ssh/
```

## Troubleshooting

**Issue: `permission denied` when writing keys**

- Ensure the host directory has proper permissions (`chmod 777`)

**Issue: `Platform not supported` or slow performance on Apple Silicon (M1/M2/M3)**

- The `--platform linux/amd64` flag is required and will use emulation
- Build times may be longer due to CPU architecture translation

**Issue: Build fails with "cannot download openssh" or connection timeout**

- Check your internet connection
- Try again later as the OpenBSD CDN might be temporarily unavailable
- You can manually download the tarball and modify the Dockerfile if needed

**Issue: Container starts but `ssh-keygen` command not found**

- Ensure the build completed successfully without errors
- Check the build logs for any compilation failures

## References

- [OpenSSH Portable Release History](https://www.openssh.com/portable.html)
- [OpenSSH Security Advisory](https://www.openssh.com/security.html)
