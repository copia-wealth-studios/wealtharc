defmodule VidarAPI.Model.PositionODataResponse do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [:context, :value]
  @type t :: %__MODULE__{context: String.t() | nil, value: VidarAPI.Model.Position.t()}
  alias VidarAPI.Deserializer

  def decode(value) do
    value |> Deserializer.deserialize(:value, :struct, VidarAPI.Model.Position)
  end
end
