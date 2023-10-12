#!/bin/bash

echo "Comienza la descarga"
cd <directory where you will put your files>
directorio=$(date +"%Y-%m-%d")
mkdir $directorio
cd $directorio

# If you want to use sftp in this way you need to have your .pub key on the server side inside
# to the archive ~/.ssh/authorized_keys, of course depend which user you will use to connect
# on the server. If you don't know how to create that key please follow the steps:

## In your $HOME execute the statement: ssh-keygen -t rsa -b 4096
## Then press ENTER
## When ask you about passphrase just press ENTER
## And ENTER again

# Now in your $HOME/.ssh/ you have the id_rsa and id_rsa.pub. In this point you have to
# put the content since "ssh-*" until your computer name inside to the ~/.ssh/authorized_keys 
# on the server side. Next step is prove if you have a free to the server

sftp <USER>@<HOST> << EOF	
cd <directory where you will download the file/s or folder/s>
get <file/s or folder/s
bye
EOF

cd ..

# How to configure the rclone to upload files or folder to share drives, please see the next post:
##	https://blogsaverroes.juntadeandalucia.es/melendo/2020/11/20/anadir-unidades-compartidas-de-google-drive-en-guadalinex-20-04-con-rclone/
rclone copy $directorio <remote>:path

