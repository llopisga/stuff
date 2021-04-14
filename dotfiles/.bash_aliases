function cheat() { curl -m 7 "http://cheat.sh/$1"; }
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
