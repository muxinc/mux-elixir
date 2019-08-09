defmodule Mux do
  @moduledoc """
  Core module for Mux. You can use the `client` method to create authenticated
  [Tesla client](https://hexdocs.pm/tesla/Tesla.html#build_client/2), which is passed to each
  request from then on.
  """

  @doc """
  Same as `Mux.client/3`, but will attempt to pull your access token ID and secret from the
  application configuration.

  Returns `%Tesla.Client{}`.

  ## Examples

      iex> Application.put_env(:mux, :access_token_id, "my_token_id")
      iex> Application.put_env(:mux, :access_token_secret, "my_token_secret")
      iex> Mux.client()
      %Tesla.Client{
        fun: nil,
        post: [],
        pre: [
          {Tesla.Middleware.BaseUrl, :call, ["https://api.mux.com"]},
          {Tesla.Middleware.BasicAuth, :call,
          [%{password: "my_token_secret", username: "my_token_id"}]}
        ]
      }

  """
  def client(options \\ []),
    do:
      client(
        Application.get_env(:mux, :access_token_id),
        Application.get_env(:mux, :access_token_secret),
        options
      )

  @doc """
  Creates a new connection struct that takes an access token ID and
  secret, as well as params.

  Returns `%Tesla.Client{}`.

  ## Examples
      iex> Mux.client("my_token_id", "my_token_secret")
      %Tesla.Client{
        fun: nil,
        post: [],
        pre: [
          {Tesla.Middleware.BaseUrl, :call, ["https://api.mux.com"]},
          {Tesla.Middleware.BasicAuth, :call,
          [%{password: "my_token_secret", username: "my_token_id"}]}
        ]
      }
  """
  def client(id, secret, options \\ []), do: Mux.Base.new(id, secret, options)
end
