echo "========INSTALLING DEPENDENCIES========="

sudo apt update \
&& sudo apt install -y jq docker.io \
&& sudo systemctl enable docker --now

echo "INSTALLING HOLEHE IN /etc/megadose/holehe"

sudo git clone https://github.com/megadose/holehe.git /etc/megadose/holehe

# tmp fix issue https://github.com/megadose/holehe/issues/209 (not merged atm)
sudo sed -i '/WORKDIR/a RUN pip install --upgrade pip setuptools wheel requests && pip install .' /etc/megadose/holehe/Dockerfile

sudo docker build /etc/megadose/holehe/. -t my-holehe-image

sudo rm -rf /etc/megadose

