export FUNCS_PATH=$HOME/dotfiles/unishell/funcs.sh

f() {
	. $FUNCS_PATH
}

vf() {
	nvim $FUNCS_PATH
}

# usefull dockers

allpine() {
	echo sudo docker run -it --hostname allpine -v $(pwd):/$(basename $(pwd)) -w $(basename $(pwd)) --rm alldevops/allpine bash
	sudo docker run -it --hostname allpine -v $(pwd):/$(basename $(pwd)) -w /$(basename $(pwd)) --rm alldevops/allpine bash
}
