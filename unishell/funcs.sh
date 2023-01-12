export FUNCS_PATH=$HOME/dotfiles/unishell/funcs.sh
export FUNCS_PATH_LOCAL=$HOME/dotfiles/unishell/funcs_local.sh
export ALIASES_PATH=$HOME/dotfiles/unishell/aliases.sh

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

# usefull dockers

allpine() {
	echo sudo docker run -it --hostname allpine -v $(pwd):/$(basename $(pwd)) -w $(basename $(pwd)) --rm alldevops/allpine bash
	sudo docker run -it --hostname allpine -v $(pwd):/$(basename $(pwd)) -w /$(basename $(pwd)) --rm alldevops/allpine bash
}
