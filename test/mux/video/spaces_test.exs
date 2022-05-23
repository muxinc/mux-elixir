defmodule Mux.Video.SpacesTest do
  use ExUnit.Case
  import Tesla.Mock

  doctest Mux.Video.Spaces

  @base_url "https://api.mux.com/video/v1/spaces"

  setup do
    client = Mux.Base.new("token_id", "token_secret", base_url: @base_url)

    mock(fn
      %{method: :get, url: @base_url} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => [
              Mux.Fixtures.space(),
              Mux.Fixtures.space()
            ]
          }
        }

      %{method: :get, url: @base_url <> "/xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk"} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => Mux.Fixtures.space()
          }
        }

      %{method: :post, url: @base_url} ->
        %Tesla.Env{
          status: 201,
          body: %{
            "data" => Mux.Fixtures.space()
          }
        }

      %{
        method: :delete,
        url:
          @base_url <>
              "/xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk"
      } ->
        %Tesla.Env{status: 204, body: ""}

      %{
        method: :post,
        url: @base_url <> "/xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk/broadcasts"
      } ->
        %Tesla.Env{status: 201, body: %{"data" => Mux.Fixtures.broadcast()}}

      %{
        method: :get,
        url:
          @base_url <>
              "/xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk/broadcasts/fZw6qjWmKLmjfi0200NBzsgGrXZImT3KiJ"
      } ->
        %Tesla.Env{status: 200, body: %{"data" => Mux.Fixtures.broadcast()}}

      %{
        method: :delete,
        url:
          @base_url <>
              "/xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk/broadcasts/fZw6qjWmKLmjfi0200NBzsgGrXZImT3KiJ"
      } ->
        %Tesla.Env{status: 204, body: ""}

      %{
        method: :post,
        url:
          @base_url <>
              "/xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk/broadcasts/fZw6qjWmKLmjfi0200NBzsgGrXZImT3KiJ/start"
      } ->
        %Tesla.Env{status: 200, body: %{"data" => %{}}}

      %{
        method: :post,
        url:
          @base_url <>
              "/xe00FkgJMdZrYQ001VC53bd01lf9ADs6YWk/broadcasts/fZw6qjWmKLmjfi0200NBzsgGrXZImT3KiJ/stop"
      } ->
        %Tesla.Env{status: 200, body: %{"data" => %{}}}
    end)

    {:ok, %{client: client}}
  end
end
