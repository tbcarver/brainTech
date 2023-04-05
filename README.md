# brainTech
My 2nd Brain for Technology

## Configure git
	git config --global user.name "Tyler Carver" \
		&& git config --global user.email "tbcarver@yahoo.com"

## Install github ssh private & public keys
*use well named ssh file i.e. id_rsa* 🤔

	mkdir -p ~/.ssh && cd ~/.ssh \
		&& touch id_rsa && chmod 600 id_rsa \
		&& nano id_rsa
copy & paste private github tbcarver ssh key from lastpass (**include ending new line**)
 
	touch id_rsa.pub && chmod 600 id_rsa.pub \
		&& nano id_rsa.pub

copy public github tbcarver ssh key from lastpass (**include ending new line**)

	eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa

see ./linux/Setup Terminal and dotfiles