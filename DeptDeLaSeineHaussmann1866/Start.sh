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
### INSTALL CHECK
if ! [ -x "$(command -v gdal-config)" ]; then
  echo "${bg_red}${white}---> Error: gdal is not installed.         <---${reset}" >&2
  exit 1
else
gdaloutputinfo=$(gdal-config --version)
echo "${white}---> Installed version of ${orange}Gdal${white} is ${green}"$gdaloutputinfo""
fi
if ! [ -x "$(command -v awk)" ]; then
  echo "${bg_red}${white}---> Error: awk is not installed.          <---${reset}" >&2
  exit 1
else
awkloutputinfo=$(awk --version)
echo "${white}---> Installed version of ${orange}Awk${white} is ${green}"$awkloutputinfo""
fi
if ! [ -x "$(command -v exiftool)" ]; then
  echo "${bg_red}${white}---> Error: ExifTool is not installed.     <---${reset}" >&2
  exit 1
else

echo "${white}---> Installed version of ${orange}Exiftool${white} is ${green}"$gdaloutputinfo""
fi
### INSTALL CHECK END
#
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd "$dir"

menu_from_array ()
{

select item; do
# Check menu item number
if [ 1 -le "$REPLY" ] && [ "$REPLY" -le $# ];

then
echo "Running $item..."
break;
else
echo "Erreur - Choisir parmis 1-$#"
fi
done
}

# Declare the array
Menu=('GeoRefSeine1866' 'util' )

# menu
menu_from_array "${Menu[@]}"

if [ $item.sh = GeoRefSeine1866.sh ]
then
./GeoRefSeine1866.sh
fi

if [ $item.sh = util.sh ]
then
./util.sh
fi

cd - 2>&1 &>/dev/null

