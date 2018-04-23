defmodule Mux.MixProject do
  use Mix.Project

  @github_url "https://github.com/muxinc/mux-elixir"

  def project do
    [
      app: :mux,
      version: "1.0.0-beta.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),

      # Docs
      name: "Mux",
      source_url: @github_url,
      homepage_url: "https://mux.com",
      docs: [main: "Mux", # The main page in the docs
              logo: "logo.png",
              extras: ["README.md"]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.0.0-beta.1"},
      {:jason, ">= 1.0.0"},
      {:ex_doc, "~> 0.18", only: :dev, runtime: false},
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false},
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE*"],
      maintainers: ["Matthew McClure <matt@mux.com>"],
      licenses: ["MIT"],
      links: %{"GitHub" => @github_url},
      description: "Official Elixir package for interacting with the Mux APIs",
    ]
  end
end
