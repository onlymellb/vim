# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

location() {
	curl https://ipinfo.io/$1\?token\=fc4cb16a9e44e0
}

igo(){
	set -o pipefail
	local version=$1
	local idir=/opt/homebrew/Cellar/go
	local url=https://go.dev/dl/go${version}.darwin-`uname -m`.tar.gz
	[[ -z ${version} ]] && echo "Please enter the golang version to install" && return 1
	[[ -d ${idir}/${version} ]] && echo "This version ${version} of golang is already installed, skipping" && return 1
	wget -O - ${url} | tar -zxvf - -C ${idir}
	[[ $? -ne 0 ]] && echo "Can't found this golang version ${version}, please check" && return 1
	mkdir ${idir}/${version}
	mv ${idir}/go ${idir}/${version}/libexec
	cp -r  ${idir}/${version}/libexec/bin  ${idir}/${version}
}

chgo() {
	local version=$1
	local sbin=/Users/Robin/local/go/bin
	local goroot=${sbin}/goroot
	local idir=/opt/homebrew/Cellar/go
	versionList=`ls ${idir} | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$'|tr '\n' '|'| sed 's/|$//'`
	[[ -z ${version} ]] && echo "The enter version is empty. Please enter one version ${versionList} to switch" && return 1
	[[ ! -d ${idir}/${version} ]] && echo "Not found this version ${version}. Please select a correct version ${versionList} to switch" && return 1
	local ibin=${idir}/${version}/bin
	local ilibexec=${idir}/${version}/libexec
	[[ -L ${sbin}/go ]] && unlink ${sbin}/go
	[[ -L ${sbin}/gofmt ]] && unlink ${sbin}/gofmt
	[[ -L ${goroot} ]] && unlink ${goroot}
	ln -s ${ibin}/go  ${sbin}/go
	ln -s ${ibin}/gofmt  ${sbin}/gofmt
	ln -s ${ilibexec} ${goroot}
	go version
}
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
