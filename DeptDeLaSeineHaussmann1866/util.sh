#/bin/bash!
orange=`tput setaf 11`
bg_orange=`tput setab 178`
purple=`tput setaf 13`
Line=`tput smul`
bold=`tput bold`
black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 15`
reset=`tput sgr0`
bg_red=`tput setab 1`
bg_green=`tput setab 2`
bg_white=`tput setab 7`
bg_blue=`tput setab 4`
lightblue=`tput setaf 45`
lightgreen=`tput setaf 46`
bleuetern=`tput setaf 45`
ilghtpurple=`tput setaf 33`
lightred=`tput setaf 161`
darkblue=`tput setaf 19`
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd "$dir"

menu_from_array ()
{

select ext; do
# Check menu item number
if [ 1 -le "$REPLY" ] && [ "$REPLY" -le $# ];

then
echo "Extenssion = "$ext""
break;
else
echo "Erreur - Choisir parmis 1-$#"
fi
done
}

# Types de fichiers source
Menu=('tiff' 'tif' 'TIFF' 'targa' 'jpg' 'psd' 'png' )

# menu
menu_from_array "${Menu[@]}"


if [ "$ext" == tiff ]
then
echo ."$ext" > extenssion_de_fichier
fi
if [ "$ext" == tif ]
then
echo ."$ext" > extenssion_de_fichier
fi
if [ "$ext" == jpg ]
then
echo ."$ext" > extenssion_de_fichier
fi
if [ "$ext" == TIFF ]
then
echo ."$ext" > extenssion_de_fichier
fi
if [ "$ext" == targa ]
then
echo ."$ext" > extenssion_de_fichier
fi
if [ "$ext" == psd ]
then
echo ."$ext" > extenssion_de_fichier
fi
if [ "$ext" == png ]
then
echo ."$ext" > extenssion_de_fichier
fi
cd - 2>&1 &>/dev/null

