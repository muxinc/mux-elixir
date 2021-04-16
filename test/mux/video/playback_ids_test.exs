defmodule Mux.Video.PlaybackIdsTest do
    use ExUnit.Case
    import Tesla.Mock
    alias Mux.Video.PlaybackIds
    doctest Mux.Video.PlaybackIds
  
    @base_url "https://api.mux.com/video/v1/playback-ids"
  
    setup do
      client = Mux.Base.new("token_id", "token_secret", base_url: @base_url)
  
      mock(fn
        %{method: :get, url: @base_url <> "/FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE"} ->
          %Tesla.Env{
            status: 200,
            body: %{
              "data" => Mux.Fixtures.playback_id()
            }
          }
      end)
  
      {:ok, %{client: client}}
    end

    describe "get/2" do
      setup do
        mock(fn
          %{method: :get, url: @base_url <> "/FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE"} ->
            %Tesla.Env{
              status: 200,
              body: %{
                "data" => Mux.Fixtures.playback_id()
              }
            }
        end)
  
        :ok
      end
  
      test "gets an asset by playback ID", %{client: client} do
        assert {:ok, %{"id" => "FRDDXsjcNgD013rx1M4CDunZ86xkq8A02hfF3b6XAa7iE"}, %Tesla.Env{}} =
                 Assets.get(client, "00ecNLnqiG8v00TLqqeZ00uCE5wCAaO3kKc")
      end
    end
  end
  