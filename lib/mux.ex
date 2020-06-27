defmodule Mux do
  @external_resource "README.md"
  @moduledoc @external_resource
             |> File.read!()
             |> String.split("<!-- MDOC !-->")
             |> Enum.fetch!(1)

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
