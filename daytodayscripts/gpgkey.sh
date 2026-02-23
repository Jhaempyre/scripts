sudo apt-get install gnupg
gpg --full-generate-key
## see the propmpts fill the details exact as on github

gpg --list-secret-keys --keyid-format=long

##From the output, copy the long form of the GPG key ID (the 16-character string after the / in the sec line).

git config --global user.signingkey <YOUR_GPG_KEY_ID>

git config --global commit.gpgsign true

##make it permanet by entring in bashscript 

echo 'export GPG_TTY=$(tty)' >> ~/.bashrc
source ~/.bashrc


##run 

echo "test" | gpg --clearsign

##add 

git config --global user.name "Your New Name"
git config --global user.email "yournewemail@example.com"

## chek here if all correct 

git config --global user.name
git config --global user.email



gpg --armor --export <YOUR_GPG_KEY_ID>
##compy whole block and add it into github gpg keys "

##now commit .happy
