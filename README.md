### Killing a dev server running on the specified port
```bash
# Usage: "kill-server 8005"
function kill-server() {
    kill $(lsof -i :$1 | sed -n 2p | awk '{print $2}')
}
```
