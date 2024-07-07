import Config

# Configure your database
config :product_app, ProductApp.Repo,
  username: "postgres",
  password: "pass",
  hostname: "localhost",
  database: "product_app_dev",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10,
  stacktrace: true

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with esbuild to recompile .js and .css sources.
config :product_app, ProductAppWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "mRp6f0YMDynnf3iHkLLsFRfmh9h7ip0mTIA+7RQy1qJyGW0bK0QWuptJnkeVhg4o",
  watchers: [
    node: ["node_modules/webpack/bin/webpack.js", "--mode", "development", "--watch",
           cd: Path.expand("../assets", __DIR__)],
    esbuild: {Esbuild, :install_and_run, [:product_app, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:product_app, ~w(--watch)]}
  ]

# Watch static and templates for browser reloading.
config :product_app, ProductAppWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/product_app_web/(controllers|live|components|views)/.*(ex|heex|eex)$",
      ~r"lib/product_app_web/templates/.*(eex)$"
    ]
  ]

# Enable dev routes for dashboard and mailbox
config :product_app, dev_routes: true

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

# Include HEEx debug annotations as HTML comments in rendered markup
config :phoenix_live_view,
  debug_heex_annotations: true,
  enable_expensive_runtime_checks: true

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false
