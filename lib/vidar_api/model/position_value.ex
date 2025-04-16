defmodule VidarAPI.Model.PositionValue do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [
    :id,
    :positionId,
    :amount,
    :currency,
    :fxRateDate,
    :fxRateFrom,
    :fxRateTo,
    :fxRate,
    :fxRateSource
  ]

  @type t :: %__MODULE__{
          id: integer() | nil,
          positionId: integer() | nil,
          amount: float() | nil,
          currency: String.t() | nil,
          fxRateDate: String.t() | nil,
          fxRateFrom: String.t() | nil,
          fxRateTo: String.t() | nil,
          fxRate: float() | nil,
          fxRateSource: String.t() | nil
        }
  def decode(value) do
    value
  end
end
