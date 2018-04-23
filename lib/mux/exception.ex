defmodule Mux.Exception do
  defexception [:message, :response]

  def exception(%{status: status} = resp) do
    msg = "An unexpected error occurred with status code: #{status}"
    %__MODULE__{message: msg, response: resp}
  end

  def exception(error) do
    %__MODULE__{message: "An unexpected error occurred.", response: error}
  end
end
