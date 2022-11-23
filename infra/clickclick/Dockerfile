FROM debian:stable-slim

EXPOSE 5000
ENV PORT=5000
ENV MIX_ENV=prod
USER root

CMD apt update
CMD apt upgrade
CMD apt install docker docker-compose git elixir
CMD git clone https://github.com/okiyama/clickclickclickclickclickclickclickclick.click.git ./clickclick
CMD cd ./clickclick/src/
CMD mix compile
CMD iex -S mix