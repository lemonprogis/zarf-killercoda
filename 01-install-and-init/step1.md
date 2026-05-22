# Install the Zarf CLI

Zarf is a single static Go binary. We'll fetch the latest release from GitHub, mark it
executable, and move it onto your `PATH`.

## Detect the latest version

```bash
ZARF_VERSION=$(curl -sIX HEAD https://github.com/zarf-dev/zarf/releases/latest | grep -i ^location: | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+')
echo "Latest Zarf version: ${ZARF_VERSION}"
```{{exec}}

## Download the binary

```bash
curl -sL "https://github.com/zarf-dev/zarf/releases/download/${ZARF_VERSION}/zarf_${ZARF_VERSION}_Linux_amd64" -o zarf
chmod +x zarf
sudo mv zarf /usr/local/bin/zarf
```{{exec}}

## Verify the install

```bash
zarf version
```{{exec}}

You should see the version string you downloaded printed back. Click **Check** when ready.
