# NOTE: This file is auto generated by OpenAPI Generator 7.12.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VidarAPI.Model.VVersionApiVersionAssetsWealthArcInstrument200Response do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :value
  ]

  @type t :: %__MODULE__{
    :value => [VidarAPI.Model.Instrument.t] | nil
  }

  alias VidarAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:value, :list, VidarAPI.Model.Instrument)
  end
end

