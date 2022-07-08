defmodule Mux.Video.TranscriptionVocabulariesTest do
  use ExUnit.Case
  import Tesla.Mock

  doctest Mux.Video.TranscriptionVocabularies

  @base_url "https://api.mux.com/video/v1/transcription-vocabularies"

  setup do
    client = Mux.Base.new("token_id", "token_secret", base_url: @base_url)

    mock(fn
      %{method: :get, url: @base_url} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => [
              Mux.Fixtures.transcription_vocabulary(),
              Mux.Fixtures.transcription_vocabulary(:update)
            ]
          }
        }

      %{method: :get, url: @base_url <> "/RjFsousKxDrwqqGtwuLIAzrmtCb016fTK"} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => Mux.Fixtures.transcription_vocabulary()
          }
        }

      %{method: :post, url: @base_url} ->
        %Tesla.Env{
          status: 201,
          body: %{
            "data" => Mux.Fixtures.transcription_vocabulary()
          }
        }

      %{
        method: :delete,
        url:
          @base_url <>
              "/RjFsousKxDrwqqGtwuLIAzrmtCb016fTK"
      } ->
        %Tesla.Env{status: 204, body: ""}

      %{
        method: :put,
        url:
          @base_url <>
              "/ANZLqMO4E01TQW01SyFJfrdZzvjMVuyYqE"
      } ->
        %Tesla.Env{status: 200, body: %{"data" => Mux.Fixtures.transcription_vocabulary(:update)}}
    end)

    {:ok, %{client: client}}
  end
end
