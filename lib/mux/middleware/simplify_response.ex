defmodule Mux.Middleware.SimplifyResponse do
  @moduledoc false
  @behaviour Tesla.Middleware

  def call(env, next, _options) do
    case Tesla.run(env, next) do
      {:ok, %{status: status} = resp} when status >= 200 and status < 300 ->
        {:ok, resp |> Map.merge(%{clean_body: get_response_contents(resp.body)})}

      {:ok, %{body: %{"error" => %{"type" => type, "messages" => messages}}} = resp} ->
        {:error, resp |> Map.merge(%{error_type: type, error_messages: messages})}

      err ->
        raise Mux.Exception, err
    end
  end

  defp get_response_contents(body) when is_map(body), do: body["data"]
  defp get_response_contents(body), do: body
end
