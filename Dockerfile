FROM mcr.microsoft.com/azure-cli:latest

COPY . /action

ENTRYPOINT ["/action/action.sh"]
