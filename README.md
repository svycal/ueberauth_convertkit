# Überauth ConvertKit [![Hex Version](https://img.shields.io/hexpm/v/ueberauth_convertkit.svg)](https://hex.pm/packages/ueberauth_convertkit)

> ConvertKit OAuth2 strategy for Überauth.

## Installation

1. Setup your application in your ConvertKit extension settings.

1. Add `:ueberauth_convertkit` to your list of dependencies in `mix.exs`:

   ```elixir
   def deps do
     [{:ueberauth_convertkit, "~> 0.2.0"}]
   end
   ```

1. Add ConvertKit to your Überauth configuration:

   ```elixir
   config :ueberauth, Ueberauth,
     providers: [
       convertkit: {Ueberauth.Strategy.ConvertKit, []}
     ]
   ```

1. Update your provider configuration:

   Use that if you want to read client ID/secret from the environment
   variables in the compile time:

   ```elixir
   config :ueberauth, Ueberauth.Strategy.ConvertKit.OAuth,
     client_id: System.get_env("CONVERTKIT_CLIENT_ID")
   ```

   Use that if you want to read client ID/secret from the environment
   variables in the run time:

   ```elixir
   config :ueberauth, Ueberauth.Strategy.ConvertKit.OAuth,
     client_id: {System, :get_env, ["CONVERTKIT_CLIENT_ID"]}
   ```

1. Include the Überauth plug in your controller:

   ```elixir
   defmodule MyApp.AuthController do
     use MyApp.Web, :controller
     plug Ueberauth
     ...
   end
   ```

1. Create the request and callback routes if you haven't already:

   ```elixir
   scope "/auth", MyApp do
     pipe_through :browser

     get "/:provider", AuthController, :request
     get "/:provider/callback", AuthController, :callback
   end
   ```

1. Your controller needs to implement callbacks to deal with `Ueberauth.Auth` and `Ueberauth.Failure` responses.

For an example implementation see the [Überauth Example](https://github.com/ueberauth/ueberauth_example) application.

## Calling

Depending on the configured url you can initiate the request through:

    /auth/convertkit

## License

Please see [LICENSE](https://github.com/svycal/ueberauth_convertkit/blob/main/LICENSE.md) for licensing details.
