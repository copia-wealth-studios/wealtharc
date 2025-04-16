# NOTE: This file is auto generated by OpenAPI Generator 7.12.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VidarAPI.Model.PortfolioDailyMetrics do
  @moduledoc """

  """

  @derive Jason.Encoder
  defstruct [
    :id,
    :portfolioId,
    :statementDate,
    :overdraftsCount,
    :custodianPerformances,
    :aums,
    :performances
  ]

  @type t :: %__MODULE__{
          :id => integer() | nil,
          :portfolioId => integer() | nil,
          :statementDate => Date.t(),
          :overdraftsCount => integer() | nil,
          :custodianPerformances => [VidarAPI.Model.CustodianPortfolioPerformance.t()] | nil,
          :aums => [VidarAPI.Model.PortfolioAum.t()] | nil,
          :performances => [VidarAPI.Model.PortfolioPerformance.t()] | nil
        }

  alias VidarAPI.Deserializer

  def decode(value) do
    value
    |> Deserializer.deserialize(:statementDate, :date, nil)
    |> Deserializer.deserialize(
      :custodianPerformances,
      :list,
      VidarAPI.Model.CustodianPortfolioPerformance
    )
    |> Deserializer.deserialize(:aums, :list, VidarAPI.Model.PortfolioAum)
    |> Deserializer.deserialize(:performances, :list, VidarAPI.Model.PortfolioPerformance)
  end
end
