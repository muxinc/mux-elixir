defmodule Mux.Middleware.SimplifyResponse do
  @moduledoc false
  @behaviour Tesla.Middleware

  def call(env, next, _options) do
    with {:ok, resp} <- Tesla.run(env, next),
         %{status: status} when status >= 200 and status < 300 <- resp do
      {:ok, resp.body["data"], resp}
    else
      %{body: %{"error" => %{"type" => type, "messages" => messages}}} -> {:error, type, messages}
      err -> raise Mux.Exception, err
    end
  end
end
