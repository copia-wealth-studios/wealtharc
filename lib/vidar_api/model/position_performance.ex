defmodule VidarAPI.Model.PositionPerformance do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [
    :positionId,
    :ytdMarket,
    :mtdMarket,
    :ytdCurrencyEffect,
    :mtdCurrencyEffect,
    :ytdPerformance,
    :mtdPerformance
  ]

  @type t :: %__MODULE__{
          positionId: integer() | nil,
          ytdMarket: float() | nil,
          mtdMarket: float() | nil,
          ytdCurrencyEffect: float() | nil,
          mtdCurrencyEffect: float() | nil,
          ytdPerformance: float() | nil,
          mtdPerformance: float() | nil
        }
  def decode(value) do
    value
  end
end
