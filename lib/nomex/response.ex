defmodule Nomex.Response do
  alias Nomex.Response

  @type t :: %Response{
    headers: list,
    body: map,
    request_url: String.t,
    status_code: integer
  }
  defstruct headers: [], body: {}, request_url: "", status_code: 0

  @typedoc """
  tuple that wraps response from `HTTPoison`.
  Returns the status of the request made, along with the `Response`
  """
  @type tuple_t :: { :ok | :error, Response.t }

  def parse(%HTTPoison.Response{ status_code: 200 } = response) do
    nomad_response = common_data(response)
    %{ nomad_response | body: decode(response.body) }
  end

  def parse(response) do
    # in a non-200 response, nomad's body is a string and not JSON
    # should a map be returned to keep things consistent?
    body = %{ error: response.body }

    nomad_response = common_data(response)
    %{ nomad_response | body: body }
  end

  defp common_data(response) do
    %Response{
      headers: response.headers,
      request_url: response.request_url,
      status_code: response.status_code
    }
  end

  defp decode(_ = "") do
    %{}
  end

  defp decode(body) do
    body |> Poison.decode!
  end
end
