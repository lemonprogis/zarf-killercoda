# Connect to the Arcade

The `dos-games` package declares a **connect service** — a friendly alias you can use with
`zarf connect` instead of remembering port-forward incantations.

## Forward the service

Run the connect command in the background so it doesn't block this terminal:

```bash
zarf connect games --cli-only &
```{{exec}}

The `--cli-only` flag tells Zarf to print the URL instead of trying to open a browser.

## Find the URL

```bash
sleep 2 && ss -ltnp | grep zarf
```{{exec}}

You'll see a `127.0.0.1:<port>` listener. In Killercoda, click the **+** above the terminal,
choose **Select port from list...**, and enter that port — a new browser tab opens onto
the running arcade.

> Killercoda blocks ports `<1024` by default. Zarf picks a high random port, so this works
> without extra config.

## Play DOOM

Pick a game from the menu. When you're done, come back and continue.
