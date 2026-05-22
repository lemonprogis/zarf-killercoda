# Connect to the Arcade

The `dos-games` package declares a **connect service** — a friendly alias you can use with
`zarf connect` instead of remembering port-forward incantations.

## Forward the service

We need two flags:

- `--address 0.0.0.0` — bind to all interfaces so Killercoda's port tunnel can reach us
  (the default `127.0.0.1` is only reachable from inside the container)
- `--local-port 8080` — pin a predictable port so we know what to open in the browser

Run the connect command in the background so it doesn't block this terminal:

```bash
zarf connect games --address 0.0.0.0 --local-port 8080 &
```{{exec}}

## Confirm it's listening

```bash
sleep 2 && ss -ltnp | grep ':8080'
```{{exec}}

You should see `0.0.0.0:8080` in the output.

## Open it in your browser

In Killercoda, click the **+** above the terminal, choose **Select port from list...**,
and enter **`8080`** — a new tab opens onto the running arcade.

## Play DOOM

Pick a game from the menu. When you're done, come back here and continue.
