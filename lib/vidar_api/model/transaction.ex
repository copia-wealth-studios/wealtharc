defmodule VidarAPI.Model.Transaction do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [
    :id,
    :portfolioId,
    :assetId,
    :type,
    :description,
    :transactionDate,
    :tradeDate,
    :valueDate,
    :quantity,
    :price,
    :priceCurrency,
    :portfolioCurrency,
    :fxRate,
    :fxRateSource,
    :externalOrderId,
    :referencedInstrumentId,
    :referencedInstrumentQuantity,
    :interest,
    :isReversal,
    :isRiskIncreased,
    :values
  ]

  @type t :: %__MODULE__{
          id: integer() | nil,
          portfolioId: integer() | nil,
          assetId: integer() | nil,
          type: VidarAPI.Model.TransactionType.t() | nil,
          description: String.t() | nil,
          transactionDate: Date.t(),
          tradeDate: Date.t() | nil,
          valueDate: Date.t() | nil,
          quantity: float() | nil,
          price: float() | nil,
          priceCurrency: String.t() | nil,
          portfolioCurrency: String.t() | nil,
          fxRate: float() | nil,
          fxRateSource: String.t() | nil,
          externalOrderId: String.t() | nil,
          referencedInstrumentId: integer() | nil,
          referencedInstrumentQuantity: float() | nil,
          interest: float() | nil,
          isReversal: boolean() | nil,
          isRiskIncreased: boolean() | nil,
          values: [VidarAPI.Model.TransactionValue.t()] | nil
        }
  alias VidarAPI.Deserializer

  def decode(value) do
    value
    |> Deserializer.deserialize(:type, :struct, VidarAPI.Model.TransactionType)
    |> Deserializer.deserialize(:transactionDate, :date, nil)
    |> Deserializer.deserialize(:tradeDate, :date, nil)
    |> Deserializer.deserialize(:valueDate, :date, nil)
    |> Deserializer.deserialize(:values, :list, VidarAPI.Model.TransactionValue)
  end
end
