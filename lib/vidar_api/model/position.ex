defmodule VidarAPI.Model.Position do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [
    :id,
    :portfolioId,
    :assetId,
    :statementDate,
    :quantity,
    :price,
    :priceCurrency,
    :valueDate,
    :priceSource,
    :unitCostInPriceCurrency,
    :allocation,
    :portfolioCurrency,
    :bookCostInPortfolioCurrency,
    :fxRate,
    :fxRateSource,
    :accruedInterestInPriceCurrency,
    :accruedInterestInPortfolioCurrency,
    :cumulativeCashflowInPriceCurrency,
    :values,
    :pnl,
    :performances
  ]

  @type t :: %__MODULE__{
          id: integer() | nil,
          portfolioId: integer() | nil,
          assetId: integer() | nil,
          statementDate: Date.t(),
          quantity: float() | nil,
          price: float() | nil,
          priceCurrency: String.t() | nil,
          valueDate: Date.t() | nil,
          priceSource: String.t() | nil,
          unitCostInPriceCurrency: float() | nil,
          allocation: float() | nil,
          portfolioCurrency: String.t() | nil,
          bookCostInPortfolioCurrency: float() | nil,
          fxRate: float() | nil,
          fxRateSource: String.t() | nil,
          accruedInterestInPriceCurrency: float() | nil,
          accruedInterestInPortfolioCurrency: float() | nil,
          cumulativeCashflowInPriceCurrency: float() | nil,
          values: [VidarAPI.Model.PositionValue.t()] | nil,
          pnl: [VidarAPI.Model.PositionPnl.t()] | nil,
          performances: [VidarAPI.Model.PositionPerformance.t()] | nil
        }
  alias VidarAPI.Deserializer

  def decode(value) do
    value
    |> Deserializer.deserialize(:statementDate, :date, nil)
    |> Deserializer.deserialize(:valueDate, :date, nil)
    |> Deserializer.deserialize(:values, :list, VidarAPI.Model.PositionValue)
    |> Deserializer.deserialize(:pnl, :list, VidarAPI.Model.PositionPnl)
    |> Deserializer.deserialize(:performances, :list, VidarAPI.Model.PositionPerformance)
  end
end
