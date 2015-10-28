### 1. Killing a dev server running on a specified port
```bash
# Usage: "kill-server 8005"
function kill-server() {
    local pid=$(lsof -i :$1 | sed -n 2p | awk '{print $2}')
	if [ -z $pid ]; then
	    echo "No server running on port $1."
	fi
	if [ ! -z $pid ]; then
	    kill $pid
	    echo "The server is dead. Long live the server!"
	fi
}
```
##### Example session
```bash
# SSH into the dev machine
$ sshwt

# Attempt to kill server on port 8005
$ kill-server 8005
$ No server running on port 8005.

# Run a dev server on that port,
#   in the background,
#   and ignore all output.
$ ./dev 8005 &> /dev/null &

# Re-attempt to kill the server
$ kill-server 8005
$ The server is dead. Long live the server!
```
