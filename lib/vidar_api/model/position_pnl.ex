defmodule VidarAPI.Model.PositionPnl do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [
    :positionId,
    :portfolioId,
    :totalPnL,
    :totalPnLPercentage,
    :marketPnL,
    :marketPnLPercentage,
    :pnLCurrencyEffect,
    :totalPnLWithCashflow,
    :totalPnLWithCashflowPercentage,
    :cumulativeCashflow
  ]

  @type t :: %__MODULE__{
          positionId: integer() | nil,
          portfolioId: integer() | nil,
          totalPnL: float() | nil,
          totalPnLPercentage: float() | nil,
          marketPnL: float() | nil,
          marketPnLPercentage: float() | nil,
          pnLCurrencyEffect: float() | nil,
          totalPnLWithCashflow: float() | nil,
          totalPnLWithCashflowPercentage: float() | nil,
          cumulativeCashflow: float() | nil
        }
  def decode(value) do
    value
  end
end
