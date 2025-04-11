# NOTE: This file is auto generated by OpenAPI Generator 7.12.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VidarAPI.Model.PortfolioDailyMetricsODataCollectionResponse do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :context,
    :count,
    :value
  ]

  @type t :: %__MODULE__{
    :context => String.t | nil,
    :count => integer() | nil,
    :value => [VidarAPI.Model.PortfolioDailyMetrics.t] | nil
  }

  alias VidarAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:value, :list, VidarAPI.Model.PortfolioDailyMetrics)
  end
end

