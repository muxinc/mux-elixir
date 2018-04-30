# Mux Elixir

Official Mux API wrapper for Elixir projects. 🙌

## Installation

Add `mux` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mux, "~> 1.0.0-beta.0"}
  ]
end
```

## Quickstart

We'll put our access token in our application configuration.

```elixir
# config/dev.exs
config :mux,
  access_token_id: "abcd1234",
  access_token_secret: "efghijkl"
```

Then use this config to initialize a new client in your application.

```elixir
client = Mux.client()
```

You can also pass the access token ID and secret directly to `client/2` function if you'd prefer:

```elixir
client = Mux.client("access_token_id", "access_token_secret")
```

Now we can use the client to do anything your heart desires (to do with the Mux API). From here we can
create new videos, manage playback IDs, etc.

```elixir
{:ok, asset, raw_env} = Mux.Assets.create(client, %{input: "https://example.com/video.mp4"});
```

Every successful response will come back with a 3 item tuple starting with `:ok`. The second item
is whatever's in the `data` key, which will typically be the the item you were interacting with. In
the example above, it's a single `asset`. The third item is the raw [Tesla](https://github.com/teamon/tesla)
Env, which is basically the raw response object. This can be useful if you want to get to metadata we
include, such as the timeframe used or the total row count returned, or if you just want to get to
headers such as the request ID for support reasons.

## Usage in Phoenix

Creating a new client before making a request is simple, but you may not want to do it every
single time you need to use a function in a controller. We suggest using `action/2` to initialize
the client and pass that to each of the controller functions.

```elixir
def action(conn, _) do
  mux_client = Mux.client() # or Mux.client("access_token_id", "access_token_secret")
  args = [conn, conn.params, mux_client]
  apply(__MODULE__, action_name(conn), args)
end

def create(conn, params, mux_client) do
  # ...
  {:ok, asset, _} = mux_client |> Mux.Video.Assets.create(%{input: "http://example.com/input.mp4"})
  # ...
end
```
