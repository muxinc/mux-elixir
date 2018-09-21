defmodule Mux.Middleware.SimplifyResponse do
  @moduledoc false
  @behaviour Tesla.Middleware

  def call(env, next, _options) do
    with {:ok, resp} <- Tesla.run(env, next),
         %{status: status} when status >= 200 and status < 300 <- resp do
      {:ok, get_response_contents(resp.body), resp}
    else
      %{body: %{"error" => %{"type" => type, "messages" => messages}}} -> {:error, type, messages}
      err -> raise Mux.Exception, err
    end
  end

  defp get_response_contents(body) when is_map(body), do: body["data"]
  defp get_response_contents(body), do: body
end
