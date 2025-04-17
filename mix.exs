defmodule VidarAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :vidar_api,
      version: "1.0.0",
      elixir: "~> 1.10",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      dialyzer: [
        plt_add_deps: :apps_tree,
        plt_add_apps: [:ex_unit, :mix],
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
      ],
      package: package(),
      description: """
      WealthDataBox API with OData.
      """,
      deps: deps()
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
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.3.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:tesla, "~> 1.7"},
      {:jason, "~> 1.4"},
      {:ex_doc, "~> 0.30", only: :dev, runtime: false},

      # Test Utils
      {:mock, "~> 0.3.7", only: :test},

      # Static Analysis
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      name: "vidar_api",
      files: ~w(.formatter.exs config lib/vidar_api mix.exs README* LICENSE*),
      organization: "copia",
      licenses: [],
      links: %{
        "GitHub" => "https://github.com/copia-wealth-studios/wealtharc"
      }
    ]
  end
end
