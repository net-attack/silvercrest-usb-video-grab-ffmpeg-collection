
INPUTFILEFORMAT="video4linux2"
SCREENSIZE="720x576"
INPUTFILE="/dev/video0"
VCODEC="libx265"

#INPUTFILE="/dev/video1"
i=1
for f in *.mp4; do
    echo "- Processing file: $f"
    i=$(( i + 1 ))
done


#ffmpeg -f $INPUTFILEFORMAT -s $SCREENSIZE -channel 1 -pix_fmt yuv420p -i $INPUTFILE -f alsa -ar 44100 -ac 2 -acodec pcm_s16le -vcodec $VCODEC -b 1200k -r 25 -acodec libmp3lame -ar 44100 -ac 2 -ab 128k -y $i.mp4

#ffmpeg -f $INPUTFILEFORMAT -i $INPUTFILE -vcodec $VCODEC -acodec libmp3lame $i.mp4

ffmpeg -i $INPUTFILE -f alsa -ar 44100 -ac 2 -acodec pcm_s16le -i hw:1 $1.mp4  
