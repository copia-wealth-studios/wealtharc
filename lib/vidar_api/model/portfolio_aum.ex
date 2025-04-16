defmodule VidarAPI.Model.PortfolioAum do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [:portfolioDailyMetricsId, :statementDate, :netAmount, :grossAmount, :currency]

  @type t :: %__MODULE__{
          portfolioDailyMetricsId: integer() | nil,
          statementDate: Date.t(),
          netAmount: float() | nil,
          grossAmount: float() | nil,
          currency: String.t() | nil
        }
  alias VidarAPI.Deserializer

  def decode(value) do
    value |> Deserializer.deserialize(:statementDate, :date, nil)
  end
end
