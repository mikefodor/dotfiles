
alias ffprobe_size="ffprobe -v error -select_streams v:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1"
alias ffprobe_resolution="ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0"

export FFMPEGARGS="-c:v libx264 -crf 24 -preset slow -c:a aac -b:a 128k"
