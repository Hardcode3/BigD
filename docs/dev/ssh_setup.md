# Setting up SSH

GitHub allows you to use SSH for two distinct purposes:

- **SSH Authentication**: Used to **securely connect to GitHub for pushing and pulling code**. This replaces HTTPS authentication with a password or token.
- **SSH Signing**: Used to **verify the authenticity of commits and tags** by cryptographically signing them. This ensures that commits come from a trusted source.

The sections below explain how to set up:

- [SSH authentication key](#ssh-authentication-for-github)
- [SSH signing key](#ssh-signing-key-for-git-and-github)

## References

- [GitHub: Adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
- [GitHub: Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [GitHub: Signing commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)
- [Setting Up SSH for Commit Signing](https://www.git-tower.com/blog/setting-up-ssh-for-commit-signing/)

## Why You Should Use Separate Keys

### Security Best Practices

- **If your authentication key is compromised, an attacker gains both push access to repositories and commit signing capability**: keeping them separate limits potential damage.

### Key Management

- GitHub allows multiple SSH keys per account, so you can **revoke a compromised signing key without affecting authentication**.

### Different Purposes

- While both use SSH keys, **authentication is about secure access**, whereas **signing is about trust and verification of code integrity**.

## SSH Authentication for GitHub

This guide explains how to set up SSH authentication on your computer to securely connect to GitHub.

### Check for Existing SSH Keys

Before creating a new SSH key, check if you already have one:

```shell
ls -al ~/.ssh
```

If you see files like id_rsa and id_rsa.pub, you already have an SSH key. If not, generate a new one.

### Generate a New SSH Key

Run the following command to create a new SSH key:

```shell
ssh-keygen -t ed25519 -C "your_email@example.com"
```

- `-t` ed25519: Uses the modern and secure Ed25519 algorithm.
- `-C`: Adds an identifier (your email).

When prompted:

- Press Enter to save the key to the default location (`~/.ssh/id_ed25519`).
- Enter a secure passphrase (optional but recommended).

### Add Your SSH Key to the SSH Agent

Ensure the SSH agent is running:

```shell
eval "$(ssh-agent -s)"
```

Then add your key:

```shell
ssh-add ~/.ssh/id_ed25519
```

### Add the SSH Key to GitHub

- Copy the SSH public key to your clipboard

```shell
cat ~/.ssh/id_ed25519.pub | pbcopy   # macOS
```

```shell
xclip -sel clip < ~/.ssh/id_ed25519.pub   # Linux
```

- Go to GitHub → Settings → SSH and GPG keys.
- Click New SSH Key, paste the copied key, and save.

### Test the Connection

Verify that your SSH key works with GitHub:

```shell
ssh -T git@github.com
```

If successful, you’ll see a message like:

```shell
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

### Configure Git to Use SSH

Set Git to use SSH instead of HTTPS:

```shell
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

## SSH Signing Key for Git and GitHub

This guide explains how to set up an SSH signing key for verifying commits and tags on GitHub using Git.

### Check for an Existing SSH Key

First, check if you already have an SSH key:

```sh
ls -al ~/.ssh
```

If you see files like `id_ed25519` and `id_ed25519.pub`, you may already have a key. If not, generate a new one.

### Generate a New SSH Signing Key

To create a new SSH key for signing:

```shell
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519_signing
```

- `-t` ed25519: Uses the Ed25519 algorithm, recommended for signing.
- `-C`: Adds an identifier (your email).
- `-f` ~/.ssh/id_ed25519_signing: Saves the key with a distinct name.

When prompted:

- Press Enter to confirm the default location.
- Enter a secure passphrase (recommended for security).

### Add the SSH Key to the SSH Agent

Ensure the SSH agent is running:

```shell
eval "$(ssh-agent -s)"
```

Then add your signing key:

```shell
ssh-add ~/.ssh/id_ed25519_signing
```

### Create a Signer File

Git allows you to specify an **SSH signer file**, making it easier to manage multiple keys.

Create the signer file:

```shell
echo "ssh-ed25519 AAAAB3...your-public-key" > ~/.ssh/signing-key.pub
```

Configure Git to use this signer file:

```shell
git config --global gpg.ssh.allowedSignersFile ~/.ssh/signing-key.pub
```

### Add the SSH Public Key to GitHub

- Copy the SSH public key:

```shell
cat ~/.ssh/id_ed25519_signing.pub | pbcopy  # macOS
```

```shell
xclip -sel clip < ~/.ssh/id_ed25519_signing.pub  # Linux
```

- Go to GitHub → Settings → SSH and GPG keys.
- Click New SSH Key, select **Signing Key**, paste the copied key, and save.

### Configure Git to Use SSH Signing

Tell Git to use your new signing key:

```shell
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519_signing.pub
git config --global commit.gpgsign true  # Auto-sign commits
```

For tag signing:

```shell
git config --global tag.gpgsign true
```

### Verify SSH Signing is Working

To check if signing is correctly set up, make a signed commit:

```shell
git commit -S -m "My signed commit"
```

Then verify:

```shell
git log --show-signature -1
```

If successful, you’ll see output like:

```shell
commit abc123 (HEAD -> main)
gpg: Signature made ...
gpg: Good signature from "your_email@example.com"
```

### Troubleshooting

If signing doesn’t work:

- Ensure you’re using Git 2.34+ (git --version).
- Restart the SSH agent and re-add the key:

```shell
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_signing
```

- Check that Git is configured correctly:

```shell
git config --global --list | grep signing
```
