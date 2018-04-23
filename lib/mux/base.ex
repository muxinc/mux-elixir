defmodule Mux.Base do
  @moduledoc false

  use Tesla

  plug Mux.Middleware.SimplifyResponse
  plug Tesla.Middleware.JSON

  @defaults [
    base_url: "https://api.mux.com"
  ]

  @doc """
  Creates a new connection client.

  Returns `%Tesla.Client{}`.

  ## Examples

      iex> Mux.Base.new("my_token_id", "my_token_secret")
      %Tesla.Client{
        fun: nil,
        post: [],
        pre: [
          {Tesla.Middleware.BaseUrl, :call, ["https://api.mux.com"]},
          {Tesla.Middleware.BasicAuth, :call,
          [%{password: "my_token_secret", username: "my_token_id"}]}
        ]
      }

      iex> Mux.Base.new("my_token_id", "my_token_secret", base_url: "https://staging.mux.com")
      %Tesla.Client{
        fun: nil,
        post: [],
        pre: [
          {Tesla.Middleware.BaseUrl, :call, ["https://staging.mux.com"]},
          {Tesla.Middleware.BasicAuth, :call,
          [%{password: "my_token_secret", username: "my_token_id"}]}
        ]
      }

  """
  def new(token_id, token_secret, opts \\ []) do
    opts = Keyword.merge(@defaults, opts) |> Enum.into(%{})

    Tesla.build_client [
      {Tesla.Middleware.BaseUrl, opts.base_url},
      {Tesla.Middleware.BasicAuth, %{username: token_id, password: token_secret}}
    ]
  end
end
