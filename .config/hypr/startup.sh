#!/usr/bin/env bash

flatpak run com.brave.Browser --app=https://mail.google.com &
flatpak run md.obsidian.Obsidian &
kitty sh -c 'tmux attach -t main || tmux new -s main' &
flatpak run com.brave.Browser --restore-last-session &
flatpak run org.signal.Signal &
flatpak run com.slack.Slack &

nextcloud
