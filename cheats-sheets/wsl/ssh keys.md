### Adding or replacing a passphrase for an existing key

To change your passphrase, you can simply run the `ssh-keygen -p` command. Specify the location of your current key, and input any old or new passphrases. There is no need to regenerate keys.

ssh-keygen -p  

Enter file in which the key is (/home/johndoe/.ssh/id_rsa):  
Enter old passphrase:  
Key has comment '/home/johndoe/.ssh/id_rsa'  
Enter new passphrase (empty for no passphrase):  
Enter same passphrase again:  
Your identification has been saved with the new passphrase.