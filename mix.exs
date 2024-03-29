defmodule Icd10cm.MixProject do
  use Mix.Project

  def project do
    [
      app: :icd10cm,
      version: "0.1.0",
      elixir: "~>  1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Icd10cm.Application, []},
      extra_applications: [:logger, :runtime_tools, :scrivener_html, :scrivener_ecto]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.9", override: true},
      {:phoenix_ecto, "~> 4.1"},
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev, override: true},
      {:phoenix_live_dashboard, "~> 0.4"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:poison, "~> 3.1"},
     # {:scrivener_ecto, "~> 2.4", override: true},
      {:scrivener_ecto, "~> 2.7", override: true},
      {:scrivener_html, "~> 1.8.1", override: true},
      {:scrivener_headers, "~> 3.1.1", override: true},
      {:scrivener_list, "~> 2.0.1"},
      # {:qr_code, "~> 2.1.0"},
      {:qr_code, "~> 2.2"},
      {:phoenix_inline_svg, "~> 1.3"},
      # {:phoenix_inline_svg, "~> 1.4"},
      # {:rose_tree, "~> 0.2.0"},
      {:bunt, "~> 0.2.0"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "cmd npm install --prefix assets"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
