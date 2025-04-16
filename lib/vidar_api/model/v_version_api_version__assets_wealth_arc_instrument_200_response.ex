defmodule VidarAPI.Model.VVersionApiVersionAssetsWealthArcInstrument200Response do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [:value]
  @type t :: %__MODULE__{value: [VidarAPI.Model.Instrument.t()] | nil}
  alias VidarAPI.Deserializer

  def decode(value) do
    value |> Deserializer.deserialize(:value, :list, VidarAPI.Model.Instrument)
  end
end
