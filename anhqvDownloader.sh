#!/bin/bash

#Time variables
START=$(date +%s)
END=0
ELAPSED=0

#Program variables
NAME=1x01
CHAPTERS=(17 14 33 15 13)
SEASON=0
CHEACKER=0

# $1=name, $s2=seasonNumber, $3=if cdn10 or 9
function download {
  echo -n -e "Downloading->$1""\n" #Chapter downloading message

  if [ $3 = "false" ]; then
    ffmpeg -i "https://cdn10.lqsa.es/$1/master.m3u8" -c:v copy -c:a aac -loglevel error "Temporada_$2/$1.mp4"
  else 
    ffmpeg -i "https://cdn9.lqsa.es/anhqv/$1/master.m3u8" -c:v copy -c:a aac -loglevel error "Temporada_$2/$1.mp4"
  fi
}


#--------------------------USER OUTPUT----------------------

#Ask the user what want to download
cat <<EOF
***************************************
*  Aquí no hay quien viva downloader  *
*                           Write     *
*   Todas/All          -->    0       *
*   Temporada/Season 1 -->    1       *
*   Temporada/Season 2 -->    2       *
*   Temporada/Season 3 -->    3       *
*   Temporada/Season 4 -->    4       *
***************************************
EOF
echo -n ">"
read SEASON


#Check if the user want to download all the seasons
if [ $SEASON != 0 ]; then
  ((CHEACKER+=1))
else 
  ((SEASON+=1))
fi

#---------------------MAIN LOOP------------------------
for ((i=$((SEASON-1)); i<${#CHAPTERS[@]}; i++))
do
  for j in $(seq 1 ${CHAPTERS[i]})
  do
    #Get the chapter
    if [ $j -lt 10 ]; then
      NAME="$SEASON""x0""$j"
    else
      NAME="$SEASON""x""$j"
    fi
    
    #Check if the file already exists
    if [ ! -e "$(dirname "$0")/Temporada_$SEASON/$NAME.mp4" ]; then

      #1,2 y todo la 4 menos 4x01 y 4x15 y toda la 5 menos 5x12,5x13
      if [ $SEASON = 1 ] || [ $SEASON = 2 ] || ([ $SEASON = 4 ] && [ $j != 1 ] && [ $j != 15 ]) || ([ $SEASON = 5 ] && [ $j != 12 ] && [ $j != 13 ])
      then
        download "$NAME" "$SEASON" "false"
      else
        download "$NAME" "$SEASON" "true"

      fi
    fi
  done

  #With only one season the program break and finish
  if [ $CHEACKER = 1 ]; then
    break
  else
    ((SEASON+=1))
  fi
done


#To display the total time 
END=$(date +%s)
ELAPSED=$(($END - $START))

echo "Completed in $((ELAPSED / 60)):$((ELAPSED % 60)) (m:s)"


