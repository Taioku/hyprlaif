rand() {
  echo $(( $RANDOM % $1 ))
}

rand_1() {
  echo $(( ($RANDOM % $1) + 1 ))
}

rand_hex() {
  hex_digits=(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  index=$((RANDOM % 16))
  echo "${hex_digits[$index]}"
}


case $(rand_1 4) in
  1)
    if [ "$(rand 100)" -eq {0..20} ]; then
      pipes.sh -p $(rand_1 5) -t $(rand_1 9) -r 0 -R | lolcat
    else
      pipes.sh -p $(rand_1 5) -t $(rand_1 9) -r 0 -R
    fi
    ;;
  2)
    if [ "$(rand 100)" -eq {0..20} ]; then
      bonsai.sh -Sim "$(fortune -s)" -b $(rand_1 3) -L $(rand_1 50) | lolcat
    else
      bonsai.sh -Sim "$(fortune -s)" -b $(rand_1 3) -L $(rand_1 50)
    fi
    ;;
  3)
    if [ "$(rand 100)" -eq {0..20} ]; then
      asciiquarium | lolcat
    else
      asciiquarium
    fi
    ;;
  4)
    if [ "$(rand 100)" -eq {0..20} ]; then
      cxxmatrix | lolcat
    else
      cxxmatrix -c "#$(rand_hex)$(rand_hex)$(rand_hex)" 
    fi
    ;;
esac
