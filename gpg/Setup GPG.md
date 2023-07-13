Ensure that setting GPG_TTY for terminal display of enter passphrase screen and keychain is managing gpg agent across terminals for tty (.gnupg/gpg-agent.conf) feature of gpg

		export GPG_TTY=$(tty)
		eval $(keychain --eval --agents gpg -q)

		mkdir -p ~/tmp && touch ~/tmp/private-key.asc && nano ~/tmp/private-key.asc
		Paste in the private key from lastpass
		gpg --import ~/tmp/private-key.asc

Edit the key to set ultimate trust

		gpg --list-secret-keys --keyid-format LONG
			should be: 7DE540CCBB56BA51
			should be: 3F718CFABD4F147DB04512527DE540CCBB56BA51
		gpg --edit-key 3F718CFABD4F147DB04512527DE540CCBB56BA51

1. Type `trust` and press Enter.
2. Follow the prompts to set the trust level for the key. You can choose from the following levels:

   - `1` = I don't know or won't say
   - `2` = I do NOT trust
   - `3` = I trust marginally
   - `4` = I trust fully
   - `5` = I trust ultimately

3. Once you have set the trust level, type `save` and press Enter to save the changes.

After setting the trust level, you can exit the interactive shell by typing `quit` and pressing Enter. The trust level should now be updated in your keyring.

		git config --global commit.gpgsign true
		git config --global user.signingkey 7DE540CCBB56BA51

To test

		mkdir test-repo \
			&& cd test-repo \
			&& git init
		echo "Hello world" >> test.txt \
			&& git add test.txt \
			&& git commit -m "Add test file"
			git log --show-signature -1


To restart

		gpgconf --kill gpg-agent
