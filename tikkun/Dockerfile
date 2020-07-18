FROM elixir:latest

RUN mix local.hex --force && \
    mix archive install hex phx_new --force

RUN apt-get update && apt-get install -y inotify-tools curl

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs