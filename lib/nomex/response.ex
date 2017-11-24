defmodule Nomex.Response do
  alias Nomex.Response

  defstruct headers: [], body: "", request_url: "", status_code: 0

  def parse(%HTTPoison.Response{ status_code: 200 } = response) do
    body = response.body |> Poison.decode!

    nomad_response = common_data(response)
    %{ nomad_response | body: body }
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
end
