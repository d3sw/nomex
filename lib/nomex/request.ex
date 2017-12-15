defmodule Nomex.Request do
  @moduledoc """
  Wrapper module for `HTTPoison.Base` and contains some convenience
  defmacro functions to keep other modules DRY
  """

  alias Nomex.{ Request, Response }
  use HTTPoison.Base

  @doc """
  Creates 2 functions with the following names:

  ```
  function_name
  function_name!
  ```

  Both functions will issue a GET request for the `path` specified.
  The first function will return a tuple.
  The second function will return a `%Nomex.Response{}` or raise an exception.
  """
  defmacro meta_get(function_name, path) do
    function_name! = banged function_name

    quote do
      @doc """
      issues a GET request to `<NOMAD_HOST>/v1#{unquote(path)}`

      returns a tuple with status (`:ok, :error`) and the `%Nomex.Response{}`
      """
      @spec unquote(function_name)() :: Response.tuple_t
      def unquote(function_name)() do
        Request.request(:get, [unquote(path)])
      end

      @doc """
      issues a GET request to `<NOMAD_HOST>/v1#{unquote(path)}`

      returns a `%Nomex.Response{}` or raises exception
      """
      @spec unquote(function_name!)() :: Response.t
      def unquote(function_name!)() do
        Request.request!(:get, [unquote(path)])
      end
    end
  end

  @doc """
  Creates 2 functions with the following names:

  ```
  function_name(param_id)
  function_name!(param_id)
  ```

  Both functions will issue a GET request for the `path` specified, but append `/param_id` at the end of the `path`.
  The first function will return a tuple.
  The second function will return a `Nomex.Response` or raise an exception.
  """
  defmacro meta_get_id(function_name, path) do
    function_name! = banged function_name

    quote do
      @doc """
      issues a GET request to `<NOMAD_HOST>/v1#{unquote(path)}/<param_id>`

      returns a tuple with status (`:ok, :error`) and the `%Nomex.Response{}`
      """
      @spec unquote(function_name)(String.t) :: Response.tuple_t
      def unquote(function_name)(param_id) do
        path = Path.join unquote(path), param_id
        Request.request(:get, [path])
      end

      @doc """
      issues a GET request to `<NOMAD_HOST>/v1#{unquote(path)}/<param_id>`

      returns a `%Nomex.Response{}` or raises exception
      """
      @spec unquote(function_name!)(String.t) :: Response.t
      def unquote(function_name!)(param_id) do
        path = Path.join unquote(path), param_id
        Request.request!(:get, [path])
      end
    end
  end


  @doc """
  Creates 2 functions with the following names:

  ```
  function_name(prefix)
  function_name!(prefix)
  ```

  Both functions will issue a GET request for the `path` specified, and adds a querystring parameter `?prefix=#(prefix)`.
  The first function will return a tuple.
  The second function will return a `Nomex.Response` or raise an exception.
  """
  defmacro meta_get_prefix(function_name, path) do
    function_name! = banged function_name

    quote do
      @doc """
      issues a GET request to `<NOMAD_HOST>/v1#{unquote(path)}?prefix=<prefix>`

      returns a tuple with status (`:ok, :error`) and the `%Nomex.Response{}`
      """
      @spec unquote(function_name)(String.t) :: Response.tuple_t
      def unquote(function_name)(prefix) do
        params = [ params: %{ prefix: prefix } ]
        Request.request(:get, [unquote(path), [], params])
      end


      @doc """
      issues a GET request to `<NOMAD_HOST>/v1#{unquote(path)}?prefix=<prefix>`

      returns a `%Nomex.Response{}` or raises exception
      """
      @spec unquote(function_name!)(String.t) :: Response.t
      def unquote(function_name!)(prefix) do
        params = [ params: %{ prefix: prefix } ]
        Request.request!(:get, [unquote(path), [], params])
      end
    end
  end

  def base do
    host = URI.parse(Nomex.host())
    version = "/#{Nomex.version()}"
    URI.merge(host, version) |> to_string
  end

  def process_url(url) do
    base() <> url
  end

  # consider removing these methods, too much abstraction?
  def request(method, params) do
    { status, response } = apply(Request, method, params)
    { status, Response.parse(response) }
  end

  def request!(method, params) do
    response = apply(Request, :"#{method}!", params)
    Response.parse response
  end

  defp banged(function_name) do
    :"#{function_name}!"
  end

  defp process_headers(headers) do
    case Nomex.token do
      nil -> headers
      _ -> [{ "X-Nomad-Token", Nomex.token } | headers]
    end
  end
end
