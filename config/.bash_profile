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

proxy(){
  export https_proxy=http://127.0.0.1:41091
  export http_proxy=http://127.0.0.1:41091
}

unproxy(){
  unset https_proxy
  unset http_proxy 
}

chgo(){
	local godir="/Users/mac/local/go"
	local gobin="/Users/mac/go/bin"
	versions=`ls $godir|tr '\n' '|'|sed 's/.$//'`
	[[ $# -eq 0 ]] && echo "chgo $versions" && return
	if [[ -d $godir/$1 ]] 
	then 
		echo "start switching to golang version $1"
		unlink $gobin/go
		unlink $gobin/gofmt
		unlink $gobin/goroot
		ln -s $godir/$1/bin/go $gobin/go
		ln -s $godir/$1/bin/gofmt $gobin/gofmt
		ln -s $godir/$1/libexec $gobin/goroot
		go version
	else
		echo "only support switching to these golang verison: $versions"
	fi
}

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
 
alias confluence="ssh robin@3.28.217.36 -p 23867"
