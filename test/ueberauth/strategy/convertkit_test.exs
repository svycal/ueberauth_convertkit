defmodule Ueberauth.Strategy.ConvertKitTest do
  @moduledoc false

  use ExUnit.Case, async: true

  use Plug.Test

  import Mox

  describe "handle_request!/1" do
    test "passes the correct data to the OAuth request" do
      authorize_url = "https://convertkitapi.test"

      expect(OAuthMock, :authorize_url!, fn params, opts ->
        assert Keyword.get(params, :scope) == ""

        assert opts == [
                 {:redirect_uri, "http://www.example.com/auth/convertkit/callback"}
               ]

        authorize_url
      end)

      conn =
        conn(:get, "/", %{})
        |> Ueberauth.run_request(:convertkit, provider_config())

      assert conn.status == 302
      assert [^authorize_url] = get_resp_header(conn, "location")
    end
  end

  defp provider_config do
    Keyword.get(Application.get_env(:ueberauth, Ueberauth)[:providers], :convertkit)
  end
end
