function stop-server() {
  kill $(lsof -i :$1 | sed -n 2p | awk '{print $2}')
}

