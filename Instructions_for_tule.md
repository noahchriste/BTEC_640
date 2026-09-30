# Accessing Tule server 

You've been given your own personal container to use for this course, your container already have all the softwares and tools you will need to do the genomics and transcriptomic projects for this semester. It runs on the University server called "Tule", and only you can access to your account. Please do not share your login credentials. 

You should have received an e-mail with your login credentials, if you did not receive it please let me know asap. 

- **Username:** your USF username
- **Password:** your full CWID
- **Port number:** a number unique to you (this stays the same all semester)



## Before you start

You must be connected to **USF WiFi**. If you are not on-campus please connect via the **USF VPN** to reach the server (this was part of your first assignment. I you have not done this, please check the instructions to connect to the University VPN  [here](https://myusf.usfca.edu/vpn))

> [!Note]
> Please try at home if you can connect to the VPN

## Step 1: Connect from your terminal

We can access to the University server via **SSH**. 
SSH (Secure Shell) is a cryptographic network protocol that let us securely log into a remote computer or server over the internet.



 >[!TIP] 
 >**Syntax: `ssh`**
 >
    >```bash
    >ssh -p portinfo username@hostname
    >```
> Where `-p` is a flag indicating that ssh is waiting for your port number. If we don't have a port information, we won't use this flag. 

Open your terminal:
- **Mac:** Terminal (Applications → Utilities → Terminal)
- **Windows:** PowerShell
- **Linux:** your usual terminal

Run the following command, replacing `YOUR_PORT` and `your-username` with your login credentials:

```bash
ssh -p YOUR_PORT yourusername@tule.usfca.edu
```

When prompted for a password, type your **full CWID** and press Enter. (Nothing will appear on screen as you type the password, that's normal, just type it and hit Enter.)

If it worked, you'll land at a command prompt inside your container. You are not working in your computer anymore, nothing that you do here, is going to show in your personal laptop. If you create a file, the file will only exists on your server account. 

Try running:

```bash
./verify_tools.sh
```

This checks that all the course software is installed and ready.

Now create your `btec_640` directory and create your README file.

## Step 2: Connect with VS Code 


1. Open VS Code → click the **Extensions** icon in the left sidebar (four squares icon).
2. Search for **"Remote - SSH"** (published by Microsoft) → click **Install**.

### Connecting

1. Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux) to open the command palette.
2. Type **"Remote-SSH: Connect to Host"** and select it.
3. Choose **"Add New SSH Host"**.
4. Type the connection command, using your own port and username:
   ```
   ssh -p YOUR_PORT yourusername@tule.usfca.edu
   ```
5. Press Enter. If asked where to save this, choose the option under your own user folder (something like `Users/you/.ssh/config`), this just saves the shortcut for next time, and is safe to accept.
6. A new VS Code window will open and prompt for a password, enter your **CWID**.
7. Once connected, go to **File → Open Folder** and open your home folder (this may show as `/data` or `~`).

You should now see your files on the left side of the screen. Go inside your `btec_640` directory and open your README file on Vs-code

