defmodule Mux.MixProject do
  use Mix.Project

  @source_url "https://github.com/muxinc/mux-elixir"
  @version "2.1.0"

  def project do
    [
      app: :mux,
      name: "Mux",
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:exvcr, "~> 0.10", only: :test},
      {:tesla, "~> 1.0"},
      {:jason, "~> 1.0"},
      {:jose, "~> 1.9"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      extras: [
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      assets: "assets",
      logo: "assets/logo.png",
      source_url: @source_url,
      source_ref: "v#{@version}",
      homepage_url: "https://mux.com",
      formatters: ["html"],
      groups_for_modules: groups_for_modules(),
      nest_modules_by_prefix: [Mux.Data, Mux.Video]
    ]
  end

  defp groups_for_modules do
    [
      Data: ~r/Mux.Data.*/,
      Video: ~r/Mux.Video.*/
    ]
  end

  defp package do
    [
      description: "Official Elixir package for interacting with the Mux APIs",
      files: ["lib", "mix.exs", "README.md", "LICENSE*"],
      maintainers: ["Matthew McClure <matt@mux.com>"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
