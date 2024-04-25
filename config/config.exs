import Config

config :ueberauth, Ueberauth,
  providers: [
    convertkit:
      {Ueberauth.Strategy.ConvertKit,
       [
         oauth2_module: OAuthMock
       ]}
  ]
