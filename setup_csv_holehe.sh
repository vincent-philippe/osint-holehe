echo "========INSTALLING DEPENDENCIES========="

sudo apt update \
&& sudo apt install -y jq docker.io \
&& sudo systemctl enable docker --now

echo "INSTALLING HOLEHE IN /etc/megadose/holehe"

sudo git clone https://github.com/megadose/holehe.git /etc/megadose/holehe
