defmodule Nomad.Allocations do
  @index_path "/allocations"

  def index do
    Nomad.request(:get, [@index_path])
  end

  def index(prefix) do
    path = "#{@index_path}?prefix=#{prefix}"
    Nomad.request(:get, [path])
  end

  def index! do
    Nomad.request!(:get, [@index_path])
  end

  def index!(prefix) do
    path = "#{@index_path}?prefix=#{prefix}"
    Nomad.request!(:get, [path])
  end
end
