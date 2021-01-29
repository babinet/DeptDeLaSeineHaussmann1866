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
cd "$dir" 2>&1 &>/dev/null
mkdir -p ../_Output ../_TRASH_TEMP
# Pieds
#
# 1 toise  = 6 pieds
# 1 careau = 200 toises
# 1 careau = 1200 pieds
# 1 pieds du roi (Charlemagne) = 0.324839385
if [ -f extenssion_de_fichier ]
then
ext=$(cat extenssion_de_fichier)
echo "${white}---> Fichier_extenssion${green}.ext = ${orange}$ext"
else
echo "${red}---> Choisir le type de fichier image${reset}"
./util.sh
ext=$(cat extenssion_de_fichier)
echo "${white}---> Fichier_extenssion${green}ext = ${orange}$ext"
fi
# Metres
#
# 1careau = 1000 mètres de côté
sudo chmod -R 777 _TRASH_TEMP
# Position du coin superieur gauche d'une planche = la postion du pilier géodésique - 2 careaux en logitude et + un careau en latitude
#echo ext $ext
for planche in "../"plan_general_de_la_ville_de_paris_et_de_ses_environs_*"$ext"
do
FileDate=$(echo $(date +%Y_%m_%d_%Hh%Mm%Ss) | tr "/" "_")
# Position théorique du Pilier Géodésique de l'Observatoire de Paris
ObsPilierGeodesiqueLong=600000
ObsPilierGeodesiqueLat=126207.433191365
SimpleName=$( echo $planche| sed "s/$ext//g"| sed "s/..\///g")
PlancheNumero=$(echo $planche| awk -v ext="$ext" -F"$ext" '{print $1}'| awk -F'plan_general_de_la_ville_de_paris_et_de_ses_environs_' '{print $2}')
echo "${white}---> \$SimpleName                  ${orange}$SimpleName"
echo "${white}---> \$PlancheNumero               ${orange}$PlancheNumero"
echo "${white}---> Position Origin (mètres) (Théorique) 600000 126207.433191365 Pilier Géodésique de l'Observatoire de Paris (Pas le puits)"
echo $planche| awk -v ext="$ext" -F"$ext" '{print $1}'
# 1 Planche
# mètres
Hauteur=4000
ExifInfo=$(exiftool "$planche")
WidthImage=$(echo $ExifInfo | awk -F'Image Width : ' '{print $2}' | awk '{print $1}')
HeightImage=$(echo $ExifInfo | awk -F'Image Height : ' '{print $2}' | awk '{print $1}')

echo "${white}---> Largeur en pixels            ${orange}$WidthImage px"
echo "${white}---> Hauteur en pixels            ${orange}$HeightImage px"
# Cas particuliers
if [[ "$PlancheNumero" == "6" ]]||[[ "$PlancheNumero" == "14" ]]||[[ "$PlancheNumero" == "21" ]]
then
# 1 Planche
# mètres
Largeur=2000
else
# 1 Planche
# mètres
Largeur=3000
fi
# Fin Cas particuliers
echo "${white}---> Hauteur en (mètres)          ${orange}4000 m"
echo "${white}---> Largeur en (mètres)          ${orange}$Largeur m"
echo "${white}---> \$planche                     ${orange}$planche"
echo "${white}---> Planche N°                   ${orange}$PlancheNumero"
# Abscissa / Ordinate
if [[ "$PlancheNumero" == "1" ]]
then
OriginX=-9000
OriginY=8000
elif [[ "$PlancheNumero" == "2" ]]
then
OriginX=-6000
OriginY=8000
elif [[ "$PlancheNumero" == "3" ]]
then
OriginX=-3000
OriginY=8000
elif [[ "$PlancheNumero" == "4" ]]
then
echo "$red hello world $white"
OriginX=0.0
OriginY=8000
elif [[ "$PlancheNumero" == "5" ]]
then
OriginX=3000
OriginY=8000
elif [[ "$PlancheNumero" == "6" ]]
then
OriginX=6000
OriginY=8000
elif [[ "$PlancheNumero" == "7" ]]
then
OriginX=8000
OriginY=4000
elif [[ "$PlancheNumero" == "8" ]]
then
OriginX=-9000
OriginY=4000
elif [[ "$PlancheNumero" == "9" ]]
then
OriginX=-6000
OriginY=4000
elif [[ "$PlancheNumero" == "10" ]]
then
OriginX=-3000
OriginY=4000
elif [[ "$PlancheNumero" == "11" ]]
then
OriginX=0
OriginY=4000
elif [[ "$PlancheNumero" == "12" ]]
then
OriginX=3000
OriginY=4000
elif [[ "$PlancheNumero" == "13" ]]
then
OriginX=6000
OriginY=4000
elif [[ "$PlancheNumero" == "14" ]]
then
OriginX=9000
OriginY=0
elif [[ "$PlancheNumero" == "15" ]]
then
OriginX=-6000
OriginY=0
elif [[ "$PlancheNumero" == "16" ]]
then
OriginX=-3000
OriginY=0
elif [[ "$PlancheNumero" == "17" ]]
then
OriginX=0
OriginY=0
elif [[ "$PlancheNumero" == "18" ]]
then
OriginX=3000
OriginY=0
elif [[ "$PlancheNumero" == "19" ]]
then
OriginX=0
OriginY=0
elif [[ "$PlancheNumero" == "20" ]]
then
OriginX=3000
OriginY=0
elif [[ "$PlancheNumero" == "21" ]]
then
OriginX=6000
OriginY=0
elif [[ "$PlancheNumero" == "22" ]]
then
OriginX=9000
OriginY=0
fi

#if [[ "$PlancheNumero" == "4" ]]
#then
#OrigineMetresX=600000
#OrigineMetresY=$(echo $ObsPilierGeodesiqueLat+8000 |bc -l)
echo $ObsPilierGeodesiqueLat+8000
#elif [[ "$PlancheNumero" == "6" ]]
#then
#OrigineMetresX=600000
#OrigineMetresY=$(echo 8000+$ObsPilierGeodesiqueLat|bc -l)
#else
OrigineMetresX=$(echo $OriginX+$ObsPilierGeodesiqueLong|bc -l)
OrigineMetresX=$(echo $OriginY+$ObsPilierGeodesiqueLat|bc -l)
#fi
Est=$(echo "$OrigineMetresX"+"$Largeur"|bc -l)
Sud=$(echo "$OrigineMetresY"-"$Hauteur"|bc -l)
echo "${white}---> \$ObsPilierGeodesiqueLat      ${green}$ObsPilierGeodesiqueLat"
echo "${white}---> \$ObsPilierGeodesiqueLong     ${green}$ObsPilierGeodesiqueLong"
echo "${white}---> \$OrigineMetresX              ${orange}$OrigineMetresX mètres Position X en Lambert Nord EPSG:27561"
echo "${white}---> \$OrigineMetresY              ${orange}$OrigineMetresY mètres Position Y en Lambert Nord EPSG:27561"
echo "${white}---> \$Est                         ${orange}$Est"
echo "${white}---> \$Sud                         ${orange}$Sud${reset}"
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$OrigineMetresX" "$OrigineMetresY" -gcp 0 "$HeightImage" "$OrigineMetresX" "$Sud" -gcp "$WidthImage" 0 "$Est" "$OrigineMetresY" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$planche" temp.tif

if [ -f "../_Output/"$SimpleName".tif" ]
then
mv "../_Output/"$SimpleName".tif" ../_TRASH_TEMP/"$FileDate"_"$SimpleName".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$SimpleName".tif"
done
if [ -f temp.tif ]
then
mv temp.tif ../_TRASH_TEMP/"$FileDate"_temp.tif
fi
cd - 2>&1 &>/dev/null
