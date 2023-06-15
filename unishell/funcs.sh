export FUNCS_PATH=$HOME/dotfiles/unishell/funcs.sh
export FUNCS_PATH_LOCAL=$HOME/dotfiles/unishell/funcs_local.sh
export ALIASES_PATH=$HOME/dotfiles/unishell/aliases.sh

v() {
	if [ -n "$*" ]; then
		nvim $* 
	elif [ -f .obsession ]; then
		nvim -S .obsession 
	elif [ -f .obs ]; then
		nvim -S .obs
	else 
		nvim
	fi
}

f() {
	. $FUNCS_PATH
}

vf() {
	nvim $FUNCS_PATH
}

vfl() {
	nvim $FUNCS_PATH_LOCAL
}

va() {
	nvim $ALIASES_PATH
}

vz() {
	nvim ~/.zshrc
}

vv() {
	nvim -c ':e $MYVIMRC'
}

vs() {
	nvim ~/dotfiles/setup/setup_on_ubuntu.sh
}

# git

push() {
	git add --all && git commit -m "$*" && git push
}

# usefull dockers

allpine() {
	echo sudo docker run -it --hostname allpine -v $(pwd):/$(basename $(pwd)) -w $(basename $(pwd)) --rm alldevops/allpine bash
	docker run -it --hostname allpine -v $(pwd):/$(basename $(pwd)) -w /$(basename $(pwd)) --rm alldevops/allpine bash
}

docker_images_rm() {
	docker image rm -f $(sudo docker images | grep "^<none>" | awk '{print $3}')
}

yq() {
	echo docker run --rm -v "${PWD}":/workdir mikefarah/yq
	docker run --rm -v "${PWD}":/workdir mikefarah/yq
}

b() {
	bin=$1
	args=${@:2}
	[ ! -d cmd/$bin ] && echo no $1 bin && return
	go build -o bin/$bin cmd/$bin/*go 
}
#complete -W "$(ls -A cmd/ 2>/dev/null || true)" b

r() {
	bin=$1
	args=${@:2}
	[ ! -d cmd/$bin ] && echo no $1 bin && return
	go build -o bin/$bin cmd/$bin/*go || return
	script -q -c "./bin/$bin $args" logs/$bin.log
	sed -i 's/\x1B\[[0-9;]*m//g; s/\r//g' logs/$bin.log
}
#complete -W "$(ls -A cmd/ 2>/dev/null || true)" r

# Generate a random password with the length specified in the first argument
pass() {
  length=$1
  < /dev/urandom tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+= | head -c${length}
  echo
}

#gpt() {
	#docker run --rm \
           #--env OPENAI_API_KEY="your OPENAI API key" \
           #--volume gpt-cache:/tmp/shell_gpt \
       #ghcr.io/ther1d/shell_gpt --chat rainbow "what are the colors of a rainbow"
#}
alias gpt="docker run --rm --env OPENAI_API_KEY --volume gpt-cache:/tmp/shell_gpt ghcr.io/ther1d/shell_gpt"
#export OPENAI_API_KEY="your OPENAI API key"
#sgpt --chat rainbow "what are the colors of a rainbow"
#sgpt --chat rainbow "inverse the list of your last answer"
#sgpt --chat rainbow "translate your last answer in french"
