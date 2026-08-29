# emby-pandastackai

Emby Server deployment config for [Pandastack](https://app.pandastack.ai).

Runs Emby Server via apt, exposed on port 8096. Built to test whether Emby can be self-hosted on Pandastack.

## Config

```json
{
  "port": 8096,
  "installCommand": "curl -fsSL https://pkg.emby.media/keys/emby-public.gpg -o /etc/apt/keyrings/emby-public.gpg && curl -fsSL https://pkg.emby.media/apt/emby.sources -o /etc/apt/sources.list.d/emby.sources && apt-get update && apt-get install -y emby-server",
  "startCommand": "emby-server"
}
```

## How it works

1. `installCommand` adds Emby's official APT repo (GPG key + sources list) and installs `emby-server`.
2. `startCommand` runs `emby-server` directly.
3. Pandastack exposes the app on port `8096`, Emby's default web UI port.

## Usage

Deploy this repo on Pandastack, then visit the app URL on port 8096 to hit the Emby setup wizard.

**Important:** when setting up the app on Pandastack, you must manually set the port to `8096` — it does not pick this up automatically from the config.

## Status

Tested and working on Pandastack.

## Platform notes

- Pandastack's managed app-hosting is Beta — no branching, point-in-time restore, or read replicas yet.
- Confirm persistent volume support before relying on this for a real media library; scale-to-zero/ephemeral storage will wipe Emby's config and library data on redeploy.
- Pandastack's primary deploy path builds from a Dockerfile via rootless BuildKit. Verify whether the `installCommand`/`startCommand`/`port` JSON format above is a supported config schema or a different (buildpack-style) deploy path.

## License

N/A (personal test project)
