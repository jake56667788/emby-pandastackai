FROM emby/embyserver:latest

COPY plugins/Emby.FastIptv.dll /config/plugins/Emby.FastIptv.dll

EXPOSE 8096
