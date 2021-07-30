defmodule Mux.Base do
  @moduledoc false

  @type result :: {:ok, any, Tesla.Env.t()} | {:error, String.t(), String.t()}

  @doc """
  Wrapper for Tesla.get/3  that returns a simplified response
  """
  @spec get(Tesla.Env.client(), String.t(), any) :: result()
  def get(client, path, params \\ []) do
    client
    |> Mux.Tesla.get(path, params)
    |> simplify_response()
  end

  @doc """
  Wrapper for Tesla.post/3 that returns a simplified response
  """
  @spec post(Tesla.Env.client(), String.t(), any) :: result()
  def post(client, path, params) do
    client
    |> Mux.Tesla.post(path, params)
    |> simplify_response()
  end

  @doc """
  Wrapper for Tesla.put/3 that returns a simplified response
  """
  @spec put(Tesla.Env.client(), String.t(), any) :: result()
  def put(client, path, params) do
    client
    |> Mux.Tesla.put(path, params)
    |> simplify_response()
  end

  @doc """
  Wrapper for Tesla.delete/2 that returns a simplified response
  """
  @spec delete(Tesla.Env.client(), String.t(), any) :: result()
  def delete(client, path, params \\ []) do
    client
    |> Mux.Tesla.delete(path, params)
    |> simplify_response()
  end

  defdelegate new(token_id, token_secret, opts \\ []), to: Mux.Tesla

  @spec simplify_response(Tesla.Env.result()) :: result()
  defp simplify_response({:ok, %{status: status} = resp}) when status >= 200 and status < 300 do
    {:ok, get_response_contents(resp.body), resp}
  end

  defp simplify_response({:ok, %{body: %{"error" => %{"type" => type, "messages" => messages}}}}) do
    {:error, type, messages}
  end

  defp simplify_response(error) do
    raise Mux.Exception, error
  end

  defp get_response_contents(body) when is_map(body), do: body["data"]
  defp get_response_contents(body), do: body
end
