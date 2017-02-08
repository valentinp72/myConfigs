#!/bin/bash

echo -e "\n\n"

echo -e "\t###################"
echo -e "\t# VIM AUTO CONFIG #"
echo -e "\t###################\n\n"


if (test $# -gt 1) then
	echo "Usage: $0 [TRUE/FALSE : override the backup file]"
	echo -e "\n	Warning: This program will remove all the vim configurations files."
	echo "	A backup of you old files will be created : ~/vimConfigSave.tar"
else

if (test -f ~/vimConfigSave.tar -a "$1" != "TRUE") then
	echo "A backup of your vim config files already exists, please remove it:"
	echo "		rm ~/vimConfigSave.tar"
	echo "or override it with:"
	echo "		$0 TRUE"
else

	echo "<- Creating a backup of the old files ->"
	echo -n "   ..."

	tar -cvf ~/vimConfigSave.tar ~/.vimrc ~/.vim ~/.vimpkg 2> /dev/null
	
	echo " ... Done"

	echo "<- Suppressing old vim config files ->"
	echo -n "   ..."

	rm ~/.vimrc
	rm -rf ~/.vim
	rm -rf ~/.vimpkg

	echo " ... Done"

	echo "<- Creating link to the new config files ->"
	echo -n "   ..."

	ln -s ~/git/myVIM/.vimrc ~/.vimrc
	ln -s ~/git/myVIM/.vim ~/.vim
	ln -s ~/git/myVIM/.vimpkg ~/.vimpkg

	echo " ... Done"

	echo "Your vim is no ready ! :)"

fi
fi

echo -e "\n\n"
