defmodule Mux.Video.TranscriptionVocabularies do
  @moduledoc """
  This module provides functions around managing transcription vocabularies in Mux Video. Transcription vocabularies
  allow you to provide collections of phrases like proper nouns, technical jargon, and uncommon words as part of
  captioning workflows. [API Documentation](https://docs.mux.com/api-reference/video#operation/create-transcription-vocabulary).
  """
  alias Mux.{Base, Fixtures}

  @path "/video/v1/transcription-vocabularies"

  @doc """
  Create a new transcription vocabulary. [API Documentation](https://docs.mux.com/api-reference/video#operation/create-transcription-vocabulary)

  Returns `{:ok, transcription_vocabulary, raw_env}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, transcription_vocabulary, _env} = Mux.Video.TranscriptionVocabularies.create(client, %{name: "API Vocabulary", phrases: ["Mux", "Live Stream", "Playback ID"]})
      iex> transcription_vocabulary
      #{inspect(Fixtures.transcription_vocabulary())}

  """
  def create(client, params) do
    Base.post(client, @path, params)
  end

  @doc """
  List transcription vocabularies. [API Documentation](https://docs.mux.com/api-reference/video#operation/list-transcription-vocabularies)

  Returns a tuple such as `{:ok, transcription_vocabularies, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, transcription_vocabularies, _env} = Mux.Video.TranscriptionVocabularies.list(client)
      iex> transcription_vocabularies
      #{inspect([Fixtures.transcription_vocabulary(), Fixtures.transcription_vocabulary(:update)])}

  """
  def list(client, params \\ []), do: Base.get(client, @path, query: params)

  @doc """
  Retrieve a transcription vocabulary by ID. [API Documentation](https://docs.mux.com/api-reference/video#operation/get-transcription-vocabulary)

  Returns a tuple such as `{:ok, transcription_vocabulary, %Telsa.Env{}}`

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, transcription_vocabulary, _env} = Mux.Video.TranscriptionVocabularies.get(client, "RjFsousKxDrwqqGtwuLIAzrmtCb016fTK")
      iex> transcription_vocabulary
      #{inspect(Fixtures.transcription_vocabulary())}

  """
  def get(client, transcription_vocabulary_id, options \\ []) do
    Base.get(client, "#{@path}/#{transcription_vocabulary_id}", query: options)
  end

  @doc """
  Delete a transcription vocabulary. [API Documentation](https://docs.mux.com/api-reference/video#operation/delete-transcription-vocabulary)

  Returns `{:ok, "", raw_env}`.

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {status, "", _env} = Mux.Video.TranscriptionVocabularies.delete(client, "RjFsousKxDrwqqGtwuLIAzrmtCb016fTK")
      iex> status
      :ok

  """
  def delete(client, transcription_vocabulary_id) do
    Base.delete(client, "#{@path}/#{transcription_vocabulary_id}")
  end

  @doc """
  Updates a transcription vocabulary

  Returns a tuple such as `{:ok, transcription_vocabulary, %Tesla.Env{}}

  ## Examples

      iex> client = Mux.Base.new("my_token_id", "my_token_secret")
      iex> {:ok, transcription_vocabulary, _env} = Mux.Video.TranscriptionVocabularies.update(client, "ANZLqMO4E01TQW01SyFJfrdZzvjMVuyYqE", %{name: "New API Vocabulary", phrases: ["Mux", "Live Stream", "Playback ID", "New phrase"]})
      iex> transcription_vocabulary
      #{inspect(Fixtures.transcription_vocabulary(:update))}
  """
  def update(client, transcription_vocabulary_id, params) do
    Base.put(client, "#{@path}/#{transcription_vocabulary_id}", params)
  end
end
