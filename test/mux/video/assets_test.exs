defmodule Mux.Video.AssetsTest do
  use ExUnit.Case
  import Tesla.Mock
  alias Mux.Video.Assets
  doctest Mux.Video.Assets

  @base_url "https://api.mux.com"

  setup do
    client = Mux.Base.new("token_id", "token_secret", base_url: @base_url)

    mock(fn
      %{method: :get, url: @base_url <> "/video/v1/assets"} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => [
              Mux.Fixtures.asset(),
              Mux.Fixtures.asset()
            ]
          }
        }

      %{method: :get, url: @base_url <> "/video/v1/assets/00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc"} ->
        %Tesla.Env{
          status: 201,
          body: %{
            "data" => Mux.Fixtures.asset()
          }
        }

      %{
        method: :get,
        url: @base_url <> "/video/v1/assets/00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc/input-info"
      } ->
        %Tesla.Env{
          status: 201,
          body: %{
            "data" => [Mux.Fixtures.input_info()]
          }
        }

      %{method: :post} ->
        %Tesla.Env{
          status: 201,
          body: %{
            "data" => Mux.Fixtures.asset(:create)
          }
        }

      %{method: :delete} ->
        %Tesla.Env{status: 204, body: ""}
    end)

    {:ok, %{client: client}}
  end

  describe "list/2" do
    setup do
      mock(fn
        %{query: [page: 2]} ->
          %Tesla.Env{
            status: 200,
            body: %{
              "data" => [
                Mux.Fixtures.asset()
              ]
            }
          }

        _ ->
          %Tesla.Env{
            status: 200,
            body: %{
              "data" => [
                Mux.Fixtures.asset(),
                Mux.Fixtures.asset()
              ]
            }
          }
      end)

      :ok
    end

    test "returns a list of assets", %{client: client} do
      {:ok, assets, _} = Assets.list(client)
      assert length(assets) == 2
    end

    test "takes query params as an option", %{client: client} do
      {:ok, assets, _} = Assets.list(client, page: 2)
      assert length(assets) == 1
    end

    test "returns a third argument that contains the raw Tesla.Env struct", %{client: client} do
      assert {:ok, _, %Tesla.Env{}} = Assets.list(client)
    end
  end

  describe "create/2" do
    setup do
      mock(fn
        %{method: :post} ->
          %Tesla.Env{
            status: 201,
            body: %{
              "data" => Mux.Fixtures.asset(:create)
            }
          }
      end)

      :ok
    end

    test "creates a new asset", %{client: client} do
      {:ok, asset, %Tesla.Env{}} = Assets.create(client, %{input: "https://foobar.com/video.mp4"})
      assert asset["status"] === "preparing"
    end
  end

  describe "get/2" do
    setup do
      mock(fn
        %{method: :get, url: @base_url <> "/video/v1/assets/00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc"} ->
          %Tesla.Env{
            status: 201,
            body: %{
              "data" => Mux.Fixtures.asset(:created)
            }
          }
      end)

      :ok
    end

    test "gets an asset by ID", %{client: client} do
      assert {:ok, %{"id" => "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc"}, %Tesla.Env{}} =
               Assets.get(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc")
    end
  end
end
