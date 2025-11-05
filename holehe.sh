cat $1|while read line
do
	echo "{\"email\": \"$line\", \"sites\": [" >> res.json \
	&& sudo docker run my-holehe-image holehe $line -NP --only-used | grep -E "[+]] [a-z]" >> res.json \
	&& echo "null]}," >> res.json \
	&& sed -i -E 's/^\[\+\]\s(.*)/\"\1\",/' res.json
done
