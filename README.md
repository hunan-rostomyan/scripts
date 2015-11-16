### 1. Kill a dev server running on a specified port
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

### 2. Listing recent branches you've been on.

##### Heuristic 1
```bash
# Get the entire reflog,
#   filter in branch transitions, selecting the 'from' branch,
#   filter in the first 60 lines,
#   sort them and eliminate duplicates.
$ git reflog | awk '/from/ {print $6}' | sed -n '1,60p' | sort | uniq
```

##### Heuristic 2
```bash
# Get the first 200 entries from reflog,
#   filter in branch transitions, selecting the 'from' branch,
#   sort them and eliminate duplicates.
$ git reflog -200 | awk '/from/ {print $6}' | sort | uniq
```
