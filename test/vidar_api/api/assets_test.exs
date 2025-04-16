defmodule VidarAPI.Api.AssetsTest do
  @moduledoc """
  Tests for functions calling Assets endpoints
  """

  use ExUnit.Case, async: false

  import Mock

  alias VidarAPI.Api.Assets
  alias VidarAPI.Connection

  alias VidarAPI.Model.{
    AssetODataCollectionResponse,
    AssetODataCollectionResponseValueInner,
    AssetODataResponse,
    CashAccount,
    CashAccountODataCollectionResponse,
    Instrument,
    InstrumentODataCollectionResponse
  }

  describe "get_asset/3" do
    # TODO: Endpoint/Spec is still bad
    @tag :skip
    test "gets an asset" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_asset_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok, %AssetODataResponse{}} == Assets.get_asset(connection, "<asset_id>")
      end
    end
  end

  defp get_asset_sample_response do
    {:ok,
    %Tesla.Env{
      method: :get,
      url: "https://api.wealthdatabox.com/v1/Assets/25202",
      query: [],
      headers: [
        {"date", "Wed, 16 Apr 2025 17:09:29 GMT"},
        {"server", "Microsoft-IIS/10.0"},
        {"content-length", "967"},
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
      body: "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#Assets/WealthArc.Instrument/$entity\",\"@odata.type\":\"#WealthArc.Instrument\",\"id\":25202,\"name\":\"UBS Group AG&GA\",\"currency\":\"CHF\",\"assetClass\":\"Equities\",\"assetSubClass\":\"Equities\",\"investmentType\":\"Equities\",\"description\":\"ASDF & FDSA\",\"quotationFactor\":1.0,\"interestRate\":null,\"maturityDate\":\"2025-07-30\",\"riskScore\":5,\"isin\":\"CH0244767585\",\"valor\":\"24476758& 222222\",\"region\":\"Poland\",\"country\":\"PL\",\"sector\":\"Financials\",\"industryGroup\":\"Diversified Financials\",\"industry\":\"Capital Markets\",\"subIndustry\":\"Diversified Capital Markets\",\"instrumentInfo\":\"sdksjfkldsjfdslkfjdslfsssssssss & sssss\",\"wkn\":\"A12DFH\",\"cusip\":\"H42097107\",\"sedol\":\"BRJL176\",\"ric\":\"UBSG.S\",\"figi\":null,\"optionType\":null,\"underlyingInstrument\":null,\"underlyingInstrumentIsin\":null,\"strikePrice\":null,\"multiplier\":1.0000,\"instrumentIssuer\":null,\"suitabilityScore\":1,\"appropriatenessScore\":2,\"priceSourceForManualPortfolio\":\"feedUBS\"}",
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

  describe "get_assets/2" do
    test "gets all assets" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_assets_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok,
                %AssetODataCollectionResponse{
                  context: nil,
                  count: nil,
                  value: [
                    %AssetODataCollectionResponseValueInner{
                      id: 25202,
                      name: "UBS Group AG&GA",
                      currency: "CHF",
                      assetClass: "Equities",
                      assetSubClass: "Equities",
                      investmentType: "Equities",
                      description: "ASDF & FDSA",
                      quotationFactor: 1.0,
                      interestRate: nil,
                      maturityDate: ~D[2025-07-30],
                      riskScore: 5,
                      iban: nil,
                      isin: "CH0244767585",
                      valor: "24476758& 222222",
                      region: "Poland",
                      country: "PL",
                      sector: "Financials",
                      industryGroup: "Diversified Financials",
                      industry: "Capital Markets",
                      subIndustry: "Diversified Capital Markets",
                      instrumentInfo: "sdksjfkldsjfdslkfjdslfsssssssss & sssss",
                      wkn: "A12DFH",
                      cusip: "H42097107",
                      sedol: "BRJL176",
                      ric: "UBSG.S",
                      figi: nil,
                      optionType: nil,
                      underlyingInstrument: nil,
                      underlyingInstrumentIsin: nil,
                      strikePrice: nil,
                      multiplier: 1.0,
                      instrumentIssuer: nil,
                      suitabilityScore: 1,
                      appropriatenessScore: 2,
                      priceSourceForManualPortfolio: "feedUBS"
                    },
                    %AssetODataCollectionResponseValueInner{
                      id: 25203,
                      name: "Swisscom AG",
                      currency: "CHF",
                      assetClass: "Equities",
                      assetSubClass: "Equities",
                      investmentType: "Equities",
                      description: nil,
                      quotationFactor: 1.0,
                      interestRate: nil,
                      maturityDate: nil,
                      riskScore: 4,
                      iban: nil,
                      isin: "CH0008742519",
                      valor: "874251",
                      region: "Switzerland",
                      country: "CH",
                      sector: "Communication Services",
                      industryGroup: "Telecommunication Services",
                      industry: "Diversified Telecommunication Services",
                      subIndustry: "Integrated Telecommunication Services",
                      instrumentInfo: nil,
                      wkn: "916234",
                      cusip: "H8398N104",
                      sedol: "5533976",
                      ric: "SCMN.S",
                      figi: nil,
                      optionType: nil,
                      underlyingInstrument: nil,
                      underlyingInstrumentIsin: nil,
                      strikePrice: nil,
                      multiplier: 1.0,
                      instrumentIssuer: nil,
                      suitabilityScore: 4,
                      appropriatenessScore: 4,
                      priceSourceForManualPortfolio: "manual"
                    }
                  ]
                }} == Assets.get_assets(connection)
      end
    end
  end

  defp get_assets_sample_response do
    {:ok,
     %Tesla.Env{
       method: :get,
       url: "https://api.wealthdatabox.com/v1/Assets",
       query: [],
       headers: [
         {"date", "Tue, 15 Apr 2025 23:13:17 GMT"},
         {"server", "Microsoft-IIS/10.0"},
         {"content-length", "779587"},
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
         "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#Assets\",\"value\":[{\"@odata.type\":\"#WealthArc.Instrument\",\"id\":25202,\"name\":\"UBS Group AG&GA\",\"currency\":\"CHF\",\"assetClass\":\"Equities\",\"assetSubClass\":\"Equities\",\"investmentType\":\"Equities\",\"description\":\"ASDF & FDSA\",\"quotationFactor\":1.0,\"interestRate\":null,\"maturityDate\":\"2025-07-30\",\"riskScore\":5,\"isin\":\"CH0244767585\",\"valor\":\"24476758& 222222\",\"region\":\"Poland\",\"country\":\"PL\",\"sector\":\"Financials\",\"industryGroup\":\"Diversified Financials\",\"industry\":\"Capital Markets\",\"subIndustry\":\"Diversified Capital Markets\",\"instrumentInfo\":\"sdksjfkldsjfdslkfjdslfsssssssss & sssss\",\"wkn\":\"A12DFH\",\"cusip\":\"H42097107\",\"sedol\":\"BRJL176\",\"ric\":\"UBSG.S\",\"figi\":null,\"optionType\":null,\"underlyingInstrument\":null,\"underlyingInstrumentIsin\":null,\"strikePrice\":null,\"multiplier\":1.0000,\"instrumentIssuer\":null,\"suitabilityScore\":1,\"appropriatenessScore\":2,\"priceSourceForManualPortfolio\":\"feedUBS\"},{\"@odata.type\":\"#WealthArc.Instrument\",\"id\":25203,\"name\":\"Swisscom AG\",\"currency\":\"CHF\",\"assetClass\":\"Equities\",\"assetSubClass\":\"Equities\",\"investmentType\":\"Equities\",\"description\":null,\"quotationFactor\":1.0,\"interestRate\":null,\"maturityDate\":null,\"riskScore\":4,\"isin\":\"CH0008742519\",\"valor\":\"874251\",\"region\":\"Switzerland\",\"country\":\"CH\",\"sector\":\"Communication Services\",\"industryGroup\":\"Telecommunication Services\",\"industry\":\"Diversified Telecommunication Services\",\"subIndustry\":\"Integrated Telecommunication Services\",\"instrumentInfo\":null,\"wkn\":\"916234\",\"cusip\":\"H8398N104\",\"sedol\":\"5533976\",\"ric\":\"SCMN.S\",\"figi\":null,\"optionType\":null,\"underlyingInstrument\":null,\"underlyingInstrumentIsin\":null,\"strikePrice\":null,\"multiplier\":1.0000,\"instrumentIssuer\":null,\"suitabilityScore\":4,\"appropriatenessScore\":4,\"priceSourceForManualPortfolio\":\"manual\"}]\}",
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

  describe "get_cash_accounts/2" do
    test "gets all cash accounts" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_cash_accounts_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok,
                %CashAccountODataCollectionResponse{
                  context: nil,
                  count: nil,
                  value: [
                    %CashAccount{
                      id: 32663,
                      name: "CASH ACCOUNT IN CHF",
                      currency: "CHF",
                      assetClass: "Cash",
                      assetSubClass: "Cash ",
                      investmentType: "Cash",
                      description: nil,
                      quotationFactor: 1.0,
                      interestRate: nil,
                      maturityDate: nil,
                      riskScore: nil,
                      iban: "9078234897"
                    },
                    %CashAccount{
                      id: 32664,
                      name: "CASH ACCOUNT IN EUR",
                      currency: "EUR",
                      assetClass: "Cash",
                      assetSubClass: "Cash ",
                      investmentType: "Cash",
                      description: nil,
                      quotationFactor: 1.0,
                      interestRate: nil,
                      maturityDate: nil,
                      riskScore: nil,
                      iban: "309231472230"
                    }
                  ]
                }} == Assets.get_cash_accounts(connection)
      end
    end
  end

  defp get_cash_accounts_sample_response do
    {:ok,
     %Tesla.Env{
       method: :get,
       url: "https://api.wealthdatabox.com/v1/Assets/WealthArc.CashAccount",
       query: [],
       headers: [
         {"date", "Tue, 15 Apr 2025 23:17:41 GMT"},
         {"server", "Microsoft-IIS/10.0"},
         {"content-length", "1096814"},
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
         "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#Assets/WealthArc.CashAccount\",\"value\":[{\"id\":32663,\"name\":\"CASH ACCOUNT IN CHF\",\"currency\":\"CHF\",\"assetClass\":\"Cash\",\"assetSubClass\":\"Cash \",\"investmentType\":\"Cash\",\"description\":null,\"quotationFactor\":1.0,\"interestRate\":null,\"maturityDate\":null,\"riskScore\":null,\"iban\":\"9078234897\"},{\"id\":32664,\"name\":\"CASH ACCOUNT IN EUR\",\"currency\":\"EUR\",\"assetClass\":\"Cash\",\"assetSubClass\":\"Cash \",\"investmentType\":\"Cash\",\"description\":null,\"quotationFactor\":1.0,\"interestRate\":null,\"maturityDate\":null,\"riskScore\":null,\"iban\":\"309231472230\"}]\}",
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

  describe "get_instruments/2" do
    test "gets all instruments" do
      with_mock(Connection, [:passthrough],
        request: fn _client, _options -> get_instruments_sample_response() end
      ) do
        connection = Connection.new(api_key: "<api_key>")

        assert {:ok,
                %InstrumentODataCollectionResponse{
                  context: nil,
                  count: nil,
                  value: [
                    %Instrument{
                      id: 28356,
                      name: "/CH/018363702100 CALL STEMLINE THRPTS RG ",
                      currency: "USD",
                      assetClass: nil,
                      assetSubClass: nil,
                      investmentType: nil,
                      description: nil,
                      quotationFactor: 1.0,
                      interestRate: nil,
                      maturityDate: nil,
                      riskScore: nil,
                      isin: nil,
                      valor: nil,
                      region: nil,
                      country: nil,
                      sector: nil,
                      industryGroup: nil,
                      industry: nil,
                      subIndustry: nil,
                      instrumentInfo: nil,
                      wkn: nil,
                      cusip: nil,
                      sedol: nil,
                      ric: nil,
                      figi: nil,
                      optionType: nil,
                      underlyingInstrument: nil,
                      underlyingInstrumentIsin: nil,
                      strikePrice: nil,
                      multiplier: 1.0,
                      instrumentIssuer: nil,
                      suitabilityScore: nil,
                      appropriatenessScore: nil,
                      priceSourceForManualPortfolio: nil
                    },
                    %Instrument{
                      id: 28433,
                      name: "/CH/030128285100 CALL AXSOME THERAPEUT RG ",
                      currency: "USD",
                      assetClass: nil,
                      assetSubClass: nil,
                      investmentType: nil,
                      description: nil,
                      quotationFactor: 1.0,
                      interestRate: nil,
                      maturityDate: nil,
                      riskScore: nil,
                      isin: nil,
                      valor: nil,
                      region: nil,
                      country: nil,
                      sector: nil,
                      industryGroup: nil,
                      industry: nil,
                      subIndustry: nil,
                      instrumentInfo: nil,
                      wkn: nil,
                      cusip: nil,
                      sedol: nil,
                      ric: nil,
                      figi: nil,
                      optionType: nil,
                      underlyingInstrument: nil,
                      underlyingInstrumentIsin: nil,
                      strikePrice: nil,
                      multiplier: 1.0,
                      instrumentIssuer: nil,
                      suitabilityScore: nil,
                      appropriatenessScore: nil,
                      priceSourceForManualPortfolio: nil
                    }
                  ]
                }} == Assets.get_instruments(connection)
      end
    end
  end

  defp get_instruments_sample_response do
    {:ok,
     %Tesla.Env{
       method: :get,
       url: "https://api.wealthdatabox.com/v1/Assets/WealthArc.Instrument",
       query: [],
       headers: [
         {"date", "Tue, 15 Apr 2025 23:20:25 GMT"},
         {"server", "Microsoft-IIS/10.0"},
         {"content-length", "2662296"},
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
         "{\"@odata.context\":\"https://api.wealthdatabox.com/v1/$metadata#Assets/WealthArc.Instrument\",\"value\":[{\"id\":28356,\"name\":\"/CH/018363702100 CALL STEMLINE THRPTS RG \",\"currency\":\"USD\",\"assetClass\":null,\"assetSubClass\":null,\"investmentType\":null,\"description\":null,\"quotationFactor\":1.0,\"interestRate\":null,\"maturityDate\":null,\"riskScore\":null,\"isin\":null,\"valor\":null,\"region\":null,\"country\":null,\"sector\":null,\"industryGroup\":null,\"industry\":null,\"subIndustry\":null,\"instrumentInfo\":null,\"wkn\":null,\"cusip\":null,\"sedol\":null,\"ric\":null,\"figi\":null,\"optionType\":null,\"underlyingInstrument\":null,\"underlyingInstrumentIsin\":null,\"strikePrice\":null,\"multiplier\":1.0000,\"instrumentIssuer\":null,\"suitabilityScore\":null,\"appropriatenessScore\":null,\"priceSourceForManualPortfolio\":null},{\"id\":28433,\"name\":\"/CH/030128285100 CALL AXSOME THERAPEUT RG \",\"currency\":\"USD\",\"assetClass\":null,\"assetSubClass\":null,\"investmentType\":null,\"description\":null,\"quotationFactor\":1.0,\"interestRate\":null,\"maturityDate\":null,\"riskScore\":null,\"isin\":null,\"valor\":null,\"region\":null,\"country\":null,\"sector\":null,\"industryGroup\":null,\"industry\":null,\"subIndustry\":null,\"instrumentInfo\":null,\"wkn\":null,\"cusip\":null,\"sedol\":null,\"ric\":null,\"figi\":null,\"optionType\":null,\"underlyingInstrument\":null,\"underlyingInstrumentIsin\":null,\"strikePrice\":null,\"multiplier\":1.0000,\"instrumentIssuer\":null,\"suitabilityScore\":null,\"appropriatenessScore\":null,\"priceSourceForManualPortfolio\":null}]\}",
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
