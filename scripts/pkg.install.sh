
## basic
echo "######## setting up apt mirror"
REPOS=mirror.kakao.com
SL=/etc/apt/sources.list
sudo sed -i.bak -re "s/([a-z]{2}.)?archive.ubuntu.com|security.ubuntu.com/${REPOS}/g" ${SL}

echo "######## update and upgrade apt repositories"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get upgrade -y

echo "######## install base packages"
sudo apt-get install -y git zsh vim neovim tmux xclip curl tree htop bash-completion jq net-tools glances

# echo "######## add desktop environment"
# sudo apt-get install -y ubuntu-desktop

echo "######## install nvidia driver"
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install -y nvidia-driver-515

echo "######## install docker"
sudo apt-get install -y docker.io docker-compose
sudo usermod -aG docker $USER

echo "######## install nvidia-docker"
distribution=$(
	. /etc/os-release
	echo $ID$VERSION_ID
)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update
sudo apt-get install -y nvidia-docker2 nvidia-container-runtime
sudo systemctl restart docker

### install i3
sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
sudo apt install i3-gaps

### node installation and npm
echo "######## install node"
curl https://get.volta.sh | bash
volta install node

### termite
echo "######## install termites' alterantive"
sudo add-apt-repository ppa:aslatter/ppa
sudo apt update
sudo apt install -y alacritty
