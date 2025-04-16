defmodule VidarAPI.Model.AssetODataResponse do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [:context, :value]

  @type t :: %__MODULE__{
          context: String.t() | nil,
          value: VidarAPI.Model.AssetODataResponseValue.t() | nil
        }
  alias VidarAPI.Deserializer

  def decode(value) do
    value |> Deserializer.deserialize(:value, :struct, VidarAPI.Model.AssetODataResponseValue)
  end
end
