
# just for the fun of it
date


whichwhich(){
	ls -al $(which $1)
}

printClr(){
	if [[ "$2" == '' ]]
	then
		echo $(printf "\x1b[38;5;148m$1\033[0m")	
	else		
		echo $(printf "\x1b[38;5;$2m$1\033[0m")	
	fi
}

mp3FromYoutube(){
    if [ -p /dev/stdin ]; then
		printClr "processing piped items"
        # If we want to read the input line by line
        while IFS= read line; do
		    printClr "Working on: $mLink"
		    youtube-dl --extract-audio --audio-format mp3 ${line} 
        done		
    else
		for mLink in "$@"
		do
		    printClr "Working on: $mLink"
		    youtube-dl --extract-audio --audio-format mp3 $mLink 
		done
    fi
}

if [ -x "$(command -v most)" ]; then
  echo Most is installed, man pages will be $(printClr colorful 209)
  export PAGER="most"
fi


getWeather(){
	curl -s "wttr.in/$1?format=3"
}

