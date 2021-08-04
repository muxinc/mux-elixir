defmodule Mux.MixProject do
  use Mix.Project

  @github_url "https://github.com/muxinc/mux-elixir"

  @version "2.1.0"

  def project do
    [
      app: :mux,
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),

      # Docs
      name: "Mux",
      source_url: @github_url,
      homepage_url: "https://mux.com",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:exvcr, "~> 0.10", only: :test},
      {:tesla, "~> 1.0"},
      {:jason, "~> 1.0"},
      {:jose, "~> 1.9"},
      {:ex_doc, "~> 0.20", only: :dev, runtime: false},
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      groups_for_modules: groups_for_modules(),
      logo: "logo.png",
      main: "Mux",
      nest_modules_by_prefix: [Mux.Data, Mux.Video],
      source_ref: "v#{@version}",
      source_url: "https://github.com/muxinc/mux-elixir"
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
      files: ["lib", "mix.exs", "README.md", "LICENSE*"],
      maintainers: ["Matthew McClure <matt@mux.com>"],
      licenses: ["MIT"],
      links: %{"GitHub" => @github_url},
      description: "Official Elixir package for interacting with the Mux APIs"
    ]
  end
end
