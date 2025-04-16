defmodule VidarAPI.Api.TransactionsTest do
  @moduledoc """
  Tests for functions calling Transactions endpoints
  """

  use ExUnit.Case, async: false

  import Mock

  alias VidarAPI.Api.Transactions
  alias VidarAPI.Connection

  alias VidarAPI.Model.{
    Transaction,
    TransactionODataCollectionResponse
  }

  describe "get_transaction/3" do
    # FIXME: Endpoint/Spec is still bad
    @tag :skip
    test "gets a transaction by id" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_transaction_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok, nil} == Transactions.get_transaction(connection, "<transaction_id>")
      end
    end
  end

  defp get_transaction_sample_response do
    {:ok,
     %Tesla.Env{
       method: :get,
       url: "https://api.wealthdatabox.com/v1/Transactions/2",
       query: [],
       headers: [
         {"date", "Wed, 16 Apr 2025 00:19:50 GMT"},
         {"server", "Microsoft-IIS/10.0"},
         {"content-length", "522"},
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
         "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#Transactions/$entity\",\"id\":2,\"portfolioId\":32662,\"assetId\":32664,\"type\":\"DepositWithdrawal\",\"description\":null,\"transactionDate\":\"2020-05-25\",\"tradeDate\":\"2020-05-25\",\"valueDate\":\"2020-05-25\",\"quantity\":2000000,\"price\":1,\"priceCurrency\":\"EUR\",\"portfolioCurrency\":\"CHF\",\"fxRate\":null,\"fxRateSource\":\"Manual\",\"externalOrderId\":\"WA.000002\",\"referencedInstrumentId\":null,\"referencedInstrumentQuantity\":null,\"interest\":null,\"isReversal\":null,\"isRiskIncreased\":null}",
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

  describe "get_transactions/2" do
    test "gets all transactions" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_transactions_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok,
                %TransactionODataCollectionResponse{
                  context: nil,
                  count: nil,
                  value: [
                    %Transaction{
                      id: 2,
                      portfolioId: 32662,
                      assetId: 32664,
                      type: "DepositWithdrawal",
                      description: nil,
                      transactionDate: ~D[2020-05-25],
                      tradeDate: ~D[2020-05-25],
                      valueDate: ~D[2020-05-25],
                      quantity: 2_000_000,
                      price: 1,
                      priceCurrency: "EUR",
                      portfolioCurrency: "CHF",
                      fxRate: nil,
                      fxRateSource: "Manual",
                      externalOrderId: "WA.000002",
                      referencedInstrumentId: nil,
                      referencedInstrumentQuantity: nil,
                      interest: nil,
                      isReversal: nil,
                      isRiskIncreased: nil,
                      values: nil
                    },
                    %Transaction{
                      id: 3,
                      portfolioId: 32662,
                      assetId: 32665,
                      type: "DepositWithdrawal",
                      description: nil,
                      transactionDate: ~D[2020-05-15],
                      tradeDate: ~D[2020-05-15],
                      valueDate: ~D[2020-05-15],
                      quantity: 4_000_000,
                      price: 1,
                      priceCurrency: "CHF",
                      portfolioCurrency: "CHF",
                      fxRate: nil,
                      fxRateSource: "Manual",
                      externalOrderId: "WA.000003",
                      referencedInstrumentId: nil,
                      referencedInstrumentQuantity: nil,
                      interest: nil,
                      isReversal: nil,
                      isRiskIncreased: nil,
                      values: nil
                    }
                  ]
                }} == Transactions.get_transactions(connection)
      end
    end
  end

  defp get_transactions_sample_response do
    {:ok,
     %Tesla.Env{
       method: :get,
       url: "https://api.wealthdatabox.com/v1/Transactions",
       query: [],
       headers: [
         {"date", "Wed, 16 Apr 2025 00:18:05 GMT"},
         {"server", "Microsoft-IIS/10.0"},
         {"content-length", "468177"},
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
         "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#Transactions\",\"value\":[{\"id\":2,\"portfolioId\":32662,\"assetId\":32664,\"type\":\"DepositWithdrawal\",\"description\":null,\"transactionDate\":\"2020-05-25\",\"tradeDate\":\"2020-05-25\",\"valueDate\":\"2020-05-25\",\"quantity\":2000000,\"price\":1,\"priceCurrency\":\"EUR\",\"portfolioCurrency\":\"CHF\",\"fxRate\":null,\"fxRateSource\":\"Manual\",\"externalOrderId\":\"WA.000002\",\"referencedInstrumentId\":null,\"referencedInstrumentQuantity\":null,\"interest\":null,\"isReversal\":null,\"isRiskIncreased\":null},{\"id\":3,\"portfolioId\":32662,\"assetId\":32665,\"type\":\"DepositWithdrawal\",\"description\":null,\"transactionDate\":\"2020-05-15\",\"tradeDate\":\"2020-05-15\",\"valueDate\":\"2020-05-15\",\"quantity\":4000000,\"price\":1,\"priceCurrency\":\"CHF\",\"portfolioCurrency\":\"CHF\",\"fxRate\":null,\"fxRateSource\":\"Manual\",\"externalOrderId\":\"WA.000003\",\"referencedInstrumentId\":null,\"referencedInstrumentQuantity\":null,\"interest\":null,\"isReversal\":null,\"isRiskIncreased\":null}]\}",
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
