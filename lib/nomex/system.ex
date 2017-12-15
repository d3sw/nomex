defmodule Nomex.System do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc("System", ["https://www.nomadproject.io/api/system.html"])


  @doc """
  issues a PUT request to `<NOMAD_HOST>/v1/system/gc`

  returns a tuple with status (`:ok or :error`) and the `%Nomex.Response{}`
  """
  def gc do
    Request.request(:put, ["/system/gc", ""])
  end

  @doc """
  issues a PUT request to `<NOMAD_HOST>/v1/system/gc`

  returns a `%Nomex.Response{}` or raises exception
  """
  def gc! do
    Request.request!(:put, ["/system/gc", ""])
  end

  @doc """
  issues a PUT request to `<NOMAD_HOST>/v1/system/reconcile/summaries`

  returns a tuple with status (`:ok or :error`) and the `%Nomex.Response{}`
  """
  def reconcile_summaries do
    Request.request(:put, ["/system/reconcile/summaries", ""])
  end

  @doc """
  issues a PUT request to `<NOMAD_HOST>/v1/system/reconcile/summaries`

  returns a `%Nomex.Response{}` or raises exception
  """
  def reconcile_summaries! do
    Request.request!(:put, ["/system/reconcile/summaries", ""])
  end
end
