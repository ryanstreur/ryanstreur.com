# Rsdc

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

  * You also need inotify-tools from apt

## Build Notes

Truncated build and deploy process:

```sh
git pull
# Add secret env variables, including MIX_ENV=prod
mix deps.get --only prod
mix compile
mix assets.deploy
mix phx.gen.release
export PHX_SERVER=true
_build/prod/rel/rsdc/bin/rsdc stop
_build/prod/rel/rsdc/bin/rsdc daemon
```

Source:

- [Phoenix: Deploying With Releases](https://hexdocs.pm/phoenix/releases.html)
- [Mix Release](https://hexdocs.pm/mix/Mix.Tasks.Release.html#module-environment-variables)

- TLS by LetsEncrypt
