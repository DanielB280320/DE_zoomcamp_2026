## ssh access with gcp: 

We need to create first a .ssh directory if it doesnt exist in our host machine. 

    - ssh-keygen -t rsa -f gpc -C daniel -b 2048 # Command to generate ssh key in our local system (linux); It will generate a private key and public key, also the private one never must be share with anyone. 

path to enter ssh key in gcp: 

    compute engine > metadata > add ssh key
    
When adding a ssh key in our project, all the instances (VMs) inherit the same key.

Connecting the gcp VM from our host: 

    ssh -i ~/.ssh/gcp daniel@35.224.182.183

    htop # Access the resources of our VM

To config the access to the VM from our host we need to create a config file within the .ssh directory with the following set up: 

    Host gcp-vm           # Connection name
        HostName 35.224.182.183 # External IP of the VM in GCP
        User daniel       # User we defined when creating the ssh key
        IdentityFile /home/aniel/.ssh/gcp # Path to the private ssh key


    sudo apt-get update # updates the list of available packages from the internet — it doesn't install or upgrade anything, just refreshes the package index so your system knows what's available and at what version.
