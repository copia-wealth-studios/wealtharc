defmodule VidarAPI.Api.PortfoliosTest do
  @moduledoc """
  Tests for functions calling Portfolios endpoints
  """

  use ExUnit.Case, async: false

  import Mock

  alias VidarAPI.Api.Portfolios
  alias VidarAPI.Connection

  alias VidarAPI.Model.{
    PortfolioODataResponse,
    PortfolioODataCollectionResponse,
    Portfolio
  }

  describe "get_portfolio/3" do
    # TODO: Endpoint/Spec is still bad
    @tag :skip
    test "gets a portfolio" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_portfolio_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok, %PortfolioODataResponse{}} ==
                 Portfolios.get_portfolio(connection, "<portfolio_id>")
      end
    end
  end

  defp get_portfolio_sample_response do
    {:ok,
     %Tesla.Env{
       method: :get,
       url: "https://api.wealthdatabox.com/v1/Portfolios/32662",
       query: [],
       headers: [
         {"date", "Wed, 16 Apr 2025 00:06:12 GMT"},
         {"server", "Microsoft-IIS/10.0"},
         {"content-length", "613"},
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
         "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#Portfolios/$entity\",\"id\":32662,\"name\":\"Stefan Meier - Julius Bar\",\"shortName\":\"Stefan Meier - Julius Bar\",\"custodianId\":\"542975.0201\",\"custodian\":\"Julius Bär\",\"currency\":\"CHF\",\"wealthArcCurrency\":\"CHF\",\"description\":null,\"additionalInfo\":null,\"isActive\":true,\"inceptionDate\":null,\"endDate\":null,\"relationshipManager\":\"David Gaser\",\"portfolioManager\":\"David Gaser\",\"assistant\":null,\"branch\":null,\"profitCenter\":null,\"parentPortfolioId\":32682,\"investmentGroup\":null,\"modelPortfolioId\":null,\"mandateType\":\"Discretionary\",\"isManual\":true,\"type\":\"Client\"}",
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

  describe "get_portfolios/2" do
    test "gets all portfolios" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_portfolios_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok,
                %PortfolioODataCollectionResponse{
                  context: nil,
                  count: nil,
                  value: [
                    %Portfolio{
                      id: 32662,
                      name: "Stefan Meier - Julius Bar",
                      shortName: "Stefan Meier - Julius Bar",
                      custodianId: "542975.0201",
                      custodian: "Julius Bär",
                      currency: "CHF",
                      wealthArcCurrency: "CHF",
                      description: nil,
                      additionalInfo: nil,
                      isActive: true,
                      inceptionDate: nil,
                      endDate: nil,
                      relationshipManager: "David Gaser",
                      portfolioManager: "David Gaser",
                      assistant: nil,
                      branch: nil,
                      profitCenter: nil,
                      parentPortfolioId: 32682,
                      investmentGroup: nil,
                      modelPortfolioId: nil,
                      mandateType: "Discretionary",
                      isManual: true,
                      type: "Client"
                    },
                    %Portfolio{
                      id: 32667,
                      name: "Stefan Meier - Pictet",
                      shortName: "Stefan Meier - Pictet",
                      custodianId: "66039384.001",
                      custodian: "Pictet",
                      currency: "CHF",
                      wealthArcCurrency: "USD",
                      description: nil,
                      additionalInfo: nil,
                      isActive: true,
                      inceptionDate: ~D[2018-06-24],
                      endDate: nil,
                      relationshipManager: "David Gaser",
                      portfolioManager: "David Gaser",
                      assistant: nil,
                      branch: nil,
                      profitCenter: nil,
                      parentPortfolioId: 32682,
                      investmentGroup: nil,
                      modelPortfolioId: 32679,
                      mandateType: "Advisory",
                      isManual: true,
                      type: "Client"
                    }
                  ]
                }} == Portfolios.get_portfolios(connection)
      end
    end
  end

  defp get_portfolios_sample_response do
    {:ok,
     %Tesla.Env{
       method: :get,
       url: "https://api.wealthdatabox.com/v1/Portfolios",
       query: [],
       headers: [
         {"date", "Wed, 16 Apr 2025 00:03:37 GMT"},
         {"server", "Microsoft-IIS/10.0"},
         {"content-length", "332258"},
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
         "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#Portfolios\",\"value\":[{\"id\":32662,\"name\":\"Stefan Meier - Julius Bar\",\"shortName\":\"Stefan Meier - Julius Bar\",\"custodianId\":\"542975.0201\",\"custodian\":\"Julius Bär\",\"currency\":\"CHF\",\"wealthArcCurrency\":\"CHF\",\"description\":null,\"additionalInfo\":null,\"isActive\":true,\"inceptionDate\":null,\"endDate\":null,\"relationshipManager\":\"David Gaser\",\"portfolioManager\":\"David Gaser\",\"assistant\":null,\"branch\":null,\"profitCenter\":null,\"parentPortfolioId\":32682,\"investmentGroup\":null,\"modelPortfolioId\":null,\"mandateType\":\"Discretionary\",\"isManual\":true,\"type\":\"Client\"},{\"id\":32667,\"name\":\"Stefan Meier - Pictet\",\"shortName\":\"Stefan Meier - Pictet\",\"custodianId\":\"66039384.001\",\"custodian\":\"Pictet\",\"currency\":\"CHF\",\"wealthArcCurrency\":\"USD\",\"description\":null,\"additionalInfo\":null,\"isActive\":true,\"inceptionDate\":\"2018-06-24\",\"endDate\":null,\"relationshipManager\":\"David Gaser\",\"portfolioManager\":\"David Gaser\",\"assistant\":null,\"branch\":null,\"profitCenter\":null,\"parentPortfolioId\":32682,\"investmentGroup\":null,\"modelPortfolioId\":32679,\"mandateType\":\"Advisory\",\"isManual\":true,\"type\":\"Client\"}]\}",
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
