defmodule MyWebsite.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_website,
      version: "0.0.1",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      preferred_cli_env: preferred_cli_env(),
      test_coverage: [tool: ExCoveralls],
      aliases: aliases(),
      deps: deps(),
      releases: releases()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {MyWebsite.Application, []}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      start: ["phx.server"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      "test.all": ["test.static", "test.coverage"],
      "test.coverage": ["coveralls --umbrella"],
      "test.static": ["format --check-formatted", "credo list --strict --all"]
    ]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:credo, "~> 1.2.2", only: [:dev, :test], runtime: false},
      {:ecto_sql, "~> 3.3.4"},
      {:ex_doc, "~> 0.21.3", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.12.2", only: [:dev, :test]},
      {:floki, "~> 0.26.0", only: [:dev, :test]},
      {:gettext, "~> 0.17.4"},
      {:jason, "~> 1.1.2"},
      {:phoenix, "~> 1.4.13"},
      {:phoenix_ecto, "~> 4.1.0"},
      {:phoenix_html, "~> 2.14.0"},
      {:phoenix_live_reload, "~> 1.2.1", only: :dev},
      {:phoenix_live_view, "~> 0.7.1"},
      {:phoenix_pubsub, "~> 1.1.2"},
      {:plug_cowboy, "~> 2.1.2"},
      {:postgrex, "~> 0.15.3"}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp preferred_cli_env do
    [
      coveralls: :test,
      "coveralls.detail": :test,
      "coveralls.post": :test,
      "coveralls.html": :test,
      "test.all": :test,
      "test.coverage": :test,
      "test.static": :test
    ]
  end

  defp releases do
    [
      my_website: [
        include_erts: false,
        include_executables_for: [:unix]
      ]
    ]
  end
end
