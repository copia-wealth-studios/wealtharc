defmodule VidarAPI.Api.PositionsTest do
  @moduledoc """
  Tests for functions calling Positions endpoints
  """

  use ExUnit.Case, async: false

  import Mock

  alias VidarAPI.Api.Positions
  alias VidarAPI.Connection

  alias VidarAPI.Model.{
    PositionODataCollectionResponse,
    Position
  }

  describe "get_position/3" do
    # TODO: Endpoint/Spec is still bad
    @tag :skip
    test "gets a position by id" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_position_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok, nil} == Positions.get_position(connection, "<position_id>")
      end
    end
  end

  defp get_position_sample_response do
    {:ok,
     %Tesla.Env{
       method: :get,
       url: "https://api.wealthdatabox.com/v1/Positions/204",
       query: [],
       headers: [
         {"date", "Wed, 16 Apr 2025 00:13:27 GMT"},
         {"server", "Microsoft-IIS/10.0"},
         {"content-length", "545"},
         {"content-type",
          "application/json; odata.metadata=minimal; odata.streaming=true; charset=utf-8"},
         {"set-cookie",
          "ARRAffinity=a5ee0dd026b0074d60e19cc7507a4621df82ae49c703b54e9551d7d4f8e290b3;Path=/;HttpOnly;Secure;Domain=api.wealthdatabox.com"},
         {"set-cookie",
          "ARRAffinitySameSite=a5ee0dd026b0074d60e19cc7507a4621df82ae49c703b54e9551d7d4f8e290b3;Path=/;HttpOnly;SameSite=None;Secure;Domain=api.wealthdatabox.com"},
         {"request-context", "appId=cid-v1:433a7ca8-c20d-4179-bec5-d77ac64fb73c"},
         {"odata-version", "4.0"},
         {"api-supported-versions", "1.0"},
         {"x-powered-by", "ASP.NET"}
       ],
       body:
         "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#Positions/$entity\",\"id\":204,\"portfolioId\":32662,\"assetId\":32664,\"statementDate\":\"2020-05-25\",\"quantity\":2000000,\"price\":1,\"priceCurrency\":\"EUR\",\"valueDate\":\"2020-05-25\",\"priceSource\":null,\"unitCostInPriceCurrency\":null,\"allocation\":0.247677210479,\"portfolioCurrency\":\"CHF\",\"bookCostInPortfolioCurrency\":null,\"fxRate\":1.05822000000000000000,\"fxRateSource\":\"Calculated\",\"accruedInterestInPortfolioCurrency\":0,\"accruedInterestInPriceCurrency\":0,\"cumulativeCashflowInPriceCurrency\":null}",
       status: 200,
       opts: [],
       __module__: Tesla,
       __client__: %Tesla.Client{
         fun: nil,
         pre: [
           {Tesla.Middleware.BaseUrl, :call, ["https://api.wealthdatabox.com/"]},
           {Tesla.Middleware.Headers, :call,
            [
              [
                {"user-agent", "openapi-generator - VidarAPI 1.0.0 - elixir"},
                {"x-api-key", "<api_key>"}
              ]
            ]},
           {Tesla.Middleware.EncodeJson, :call, [[engine: Jason]]}
         ],
         post: [],
         adapter: {Tesla.Adapter.Httpc, :call, [[]]}
       }
     }}
  end

  describe "get_positions/2" do
    test "gets all positions" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_positions_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok,
                %PositionODataCollectionResponse{
                  context: nil,
                  count: nil,
                  value: [
                    %Position{
                      id: 204,
                      portfolioId: 32662,
                      assetId: 32664,
                      statementDate: ~D[2020-05-25],
                      quantity: 2_000_000,
                      price: 1,
                      priceCurrency: "EUR",
                      valueDate: ~D[2020-05-25],
                      priceSource: nil,
                      unitCostInPriceCurrency: nil,
                      allocation: 0.247677210479,
                      portfolioCurrency: "CHF",
                      bookCostInPortfolioCurrency: nil,
                      fxRate: 1.05822,
                      fxRateSource: "Calculated",
                      accruedInterestInPriceCurrency: 0,
                      accruedInterestInPortfolioCurrency: 0,
                      cumulativeCashflowInPriceCurrency: nil,
                      values: nil,
                      pnl: nil,
                      performances: nil
                    },
                    %Position{
                      id: 205,
                      portfolioId: 32662,
                      assetId: 32664,
                      statementDate: ~D[2020-05-26],
                      quantity: 2_000_000,
                      price: 1,
                      priceCurrency: "EUR",
                      valueDate: ~D[2020-05-26],
                      priceSource: nil,
                      unitCostInPriceCurrency: nil,
                      allocation: 0.248812980314,
                      portfolioCurrency: "CHF",
                      bookCostInPortfolioCurrency: nil,
                      fxRate: 1.06307,
                      fxRateSource: "Calculated",
                      accruedInterestInPriceCurrency: 0,
                      accruedInterestInPortfolioCurrency: 0,
                      cumulativeCashflowInPriceCurrency: nil,
                      values: nil,
                      pnl: nil,
                      performances: nil
                    }
                  ]
                }} == Positions.get_positions(connection)
      end
    end
  end

  defp get_positions_sample_response do
    {:ok,
     %Tesla.Env{
       method: :get,
       url: "https://api.wealthdatabox.com/v1/Positions",
       query: [],
       headers: [
         {"date", "Wed, 16 Apr 2025 00:12:32 GMT"},
         {"server", "Microsoft-IIS/10.0"},
         {"content-length", "464526"},
         {"content-type",
          "application/json; odata.metadata=minimal; odata.streaming=true; charset=utf-8"},
         {"set-cookie",
          "ARRAffinity=a5ee0dd026b0074d60e19cc7507a4621df82ae49c703b54e9551d7d4f8e290b3;Path=/;HttpOnly;Secure;Domain=api.wealthdatabox.com"},
         {"set-cookie",
          "ARRAffinitySameSite=a5ee0dd026b0074d60e19cc7507a4621df82ae49c703b54e9551d7d4f8e290b3;Path=/;HttpOnly;SameSite=None;Secure;Domain=api.wealthdatabox.com"},
         {"request-context", "appId=cid-v1:433a7ca8-c20d-4179-bec5-d77ac64fb73c"},
         {"odata-version", "4.0"},
         {"api-supported-versions", "1.0"},
         {"x-powered-by", "ASP.NET"}
       ],
       body:
         "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#Positions\",\"value\":[{\"id\":204,\"portfolioId\":32662,\"assetId\":32664,\"statementDate\":\"2020-05-25\",\"quantity\":2000000,\"price\":1,\"priceCurrency\":\"EUR\",\"valueDate\":\"2020-05-25\",\"priceSource\":null,\"unitCostInPriceCurrency\":null,\"allocation\":0.247677210479,\"portfolioCurrency\":\"CHF\",\"bookCostInPortfolioCurrency\":null,\"fxRate\":1.05822000000000000000,\"fxRateSource\":\"Calculated\",\"accruedInterestInPortfolioCurrency\":0,\"accruedInterestInPriceCurrency\":0,\"cumulativeCashflowInPriceCurrency\":null},{\"id\":205,\"portfolioId\":32662,\"assetId\":32664,\"statementDate\":\"2020-05-26\",\"quantity\":2000000,\"price\":1,\"priceCurrency\":\"EUR\",\"valueDate\":\"2020-05-26\",\"priceSource\":null,\"unitCostInPriceCurrency\":null,\"allocation\":0.248812980314,\"portfolioCurrency\":\"CHF\",\"bookCostInPortfolioCurrency\":null,\"fxRate\":1.06307000000000000000,\"fxRateSource\":\"Calculated\",\"accruedInterestInPortfolioCurrency\":0,\"accruedInterestInPriceCurrency\":0,\"cumulativeCashflowInPriceCurrency\":null}]\}",
       status: 200,
       opts: [],
       __module__: Tesla,
       __client__: %Tesla.Client{
         fun: nil,
         pre: [
           {Tesla.Middleware.BaseUrl, :call, ["https://api.wealthdatabox.com/"]},
           {Tesla.Middleware.Headers, :call,
            [
              [
                {"user-agent", "openapi-generator - VidarAPI 1.0.0 - elixir"},
                {"x-api-key", "<api_key>"}
              ]
            ]},
           {Tesla.Middleware.EncodeJson, :call, [[engine: Jason]]}
         ],
         post: [],
         adapter: {Tesla.Adapter.Httpc, :call, [[]]}
       }
     }}
  end
end
