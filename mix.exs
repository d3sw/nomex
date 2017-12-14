defmodule Nomex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :nomex,
      version: "0.0.3",
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:exvcr, "~> 0.8", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description() do
    "Unofficial HashiCorp Nomad Client for Elixir"
  end

  defp package() do
    [
      name: "nomex",
      licenses: ["Apache-2.0"],
      maintainers: ["Jin Lee"],
      links: %{"GitHub" => "https://github.com/d3sw/nomex"}
    ]
  end
end
