defmodule VidarAPI.Model.PortfolioDailyMetricsODataResponse do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [:context, :value]

  @type t :: %__MODULE__{
          context: String.t() | nil,
          value: VidarAPI.Model.PortfolioDailyMetrics.t()
        }
  alias VidarAPI.Deserializer

  def decode(value) do
    value |> Deserializer.deserialize(:value, :struct, VidarAPI.Model.PortfolioDailyMetrics)
  end
end
