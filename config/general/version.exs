import Config

commit = System.get_env("APP_COMMIT")
release = Keyword.get(Mix.Project.config(), :version)

config :my_website, MyWebsite.Version,
  commit: commit,
  release: release
