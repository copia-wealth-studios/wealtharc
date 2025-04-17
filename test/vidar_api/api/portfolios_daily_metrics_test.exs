defmodule VidarAPI.Api.PortfoliosDailyMetricsTest do
  @moduledoc """
  Tests for functions calling PortfoliosDailyMetrics endpoints
  """

  use ExUnit.Case, async: false

  import Mock

  alias VidarAPI.Api.PortfoliosDailyMetrics
  alias VidarAPI.Connection

  alias VidarAPI.Model.{
    PortfolioDailyMetrics,
    PortfolioDailyMetricsODataCollectionResponse
  }

  describe "get_portfolio_daily_metrics/3" do
    # TODO: Endpoint/Spec is still bad
    @tag :skip
    test "gets a portfolio daily metrics by id" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_portfolio_daily_metrics_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok, %{}} ==
                 PortfoliosDailyMetrics.get_portfolio_daily_metrics(connection, "<metrics_id>")
      end
    end
  end

  defp get_portfolio_daily_metrics_sample_response do
    {:ok,
     %Tesla.Env{
       method: :get,
       url: "https://api.wealthdatabox.com/v1/PortfoliosDailyMetrics/37739",
       query: [],
       headers: [
         {"date", "Tue, 15 Apr 2025 23:40:53 GMT"},
         {"server", "Microsoft-IIS/10.0"},
         {"content-length", "177"},
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
         "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#PortfoliosDailyMetrics/$entity\",\"id\":37739,\"portfolioId\":33410,\"statementDate\":\"2024-04-11\",\"overdraftsCount\":null}",
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

  describe "get_portfolio_daily_metricss/3" do
    test "gets all portfolio daily metrics" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_portfolio_daily_metricss_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok,
                %PortfolioDailyMetricsODataCollectionResponse{
                  context: nil,
                  count: nil,
                  value: [
                    %PortfolioDailyMetrics{
                      id: 24,
                      portfolioId: 37739,
                      statementDate: ~D[2024-01-17],
                      overdraftsCount: 0,
                      custodianPerformances: nil,
                      aums: nil,
                      performances: nil
                    },
                    %PortfolioDailyMetrics{
                      id: 25,
                      portfolioId: 37616,
                      statementDate: ~D[2024-01-17],
                      overdraftsCount: 0,
                      custodianPerformances: nil,
                      aums: nil,
                      performances: nil
                    }
                  ]
                }} == PortfoliosDailyMetrics.get_portfolio_daily_metricss(connection)
      end
    end
  end

  defp get_portfolio_daily_metricss_sample_response do
    {:ok,
     %Tesla.Env{
       method: :get,
       url: "https://api.wealthdatabox.com/v1/PortfoliosDailyMetrics",
       query: [],
       headers: [
         {"date", "Tue, 15 Apr 2025 23:40:11 GMT"},
         {"server", "Microsoft-IIS/10.0"},
         {"content-length", "81898"},
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
         "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#PortfoliosDailyMetrics\",\"value\":[{\"id\":24,\"portfolioId\":37739,\"statementDate\":\"2024-01-17\",\"overdraftsCount\":0},{\"id\":25,\"portfolioId\":37616,\"statementDate\":\"2024-01-17\",\"overdraftsCount\":0}]\}",
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
