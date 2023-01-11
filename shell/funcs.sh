export FUNCS_PATH=$HOME/dotfiles/shell/funcs.sh

f() {
	. $FUNCS_PATH
}

vf() {
	nvim $FUNCS_PATH
}
