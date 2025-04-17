defmodule VidarAPI.Model.CustodianPortfolioPerformance do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [
    :portfolioId,
    :statementDate,
    :portfolioCurrency,
    :ytdCalculationStartDate,
    :ytdGross,
    :ytdNet,
    :mtdGross,
    :mtdNet
  ]

  @type t :: %__MODULE__{
          portfolioId: integer() | nil,
          statementDate: Date.t(),
          portfolioCurrency: String.t() | nil,
          ytdCalculationStartDate: Date.t() | nil,
          ytdGross: float() | nil,
          ytdNet: float() | nil,
          mtdGross: float() | nil,
          mtdNet: float() | nil
        }
  alias VidarAPI.Deserializer

  def decode(value) do
    value
    |> Deserializer.deserialize(:statementDate, :date, nil)
    |> Deserializer.deserialize(:ytdCalculationStartDate, :date, nil)
  end
end
