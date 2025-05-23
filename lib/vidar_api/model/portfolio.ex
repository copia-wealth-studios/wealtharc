defmodule VidarAPI.Model.Portfolio do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [
    :id,
    :name,
    :shortName,
    :custodianId,
    :custodian,
    :currency,
    :wealthArcCurrency,
    :description,
    :additionalInfo,
    :isActive,
    :inceptionDate,
    :endDate,
    :relationshipManager,
    :portfolioManager,
    :assistant,
    :branch,
    :profitCenter,
    :parentPortfolioId,
    :investmentGroup,
    :modelPortfolioId,
    :mandateType,
    :isManual,
    :type
  ]

  @type t :: %__MODULE__{
          id: integer() | nil,
          name: String.t() | nil,
          shortName: String.t() | nil,
          custodianId: String.t() | nil,
          custodian: String.t() | nil,
          currency: String.t() | nil,
          wealthArcCurrency: String.t() | nil,
          description: String.t() | nil,
          additionalInfo: String.t() | nil,
          isActive: boolean() | nil,
          inceptionDate: Date.t() | nil,
          endDate: Date.t() | nil,
          relationshipManager: String.t() | nil,
          portfolioManager: String.t() | nil,
          assistant: String.t() | nil,
          branch: String.t() | nil,
          profitCenter: String.t() | nil,
          parentPortfolioId: integer() | nil,
          investmentGroup: String.t() | nil,
          modelPortfolioId: integer() | nil,
          mandateType: VidarAPI.Model.MandateType.t() | nil,
          isManual: boolean() | nil,
          type: VidarAPI.Model.PortfolioType.t() | nil
        }
  alias VidarAPI.Deserializer

  def decode(value) do
    value
    |> Deserializer.deserialize(:inceptionDate, :date, nil)
    |> Deserializer.deserialize(:endDate, :date, nil)
    |> Deserializer.deserialize(:mandateType, :struct, VidarAPI.Model.MandateType)
    |> Deserializer.deserialize(:type, :struct, VidarAPI.Model.PortfolioType)
  end
end
