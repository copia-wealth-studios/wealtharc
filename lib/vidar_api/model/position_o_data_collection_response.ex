defmodule VidarAPI.Model.PositionODataCollectionResponse do
  @moduledoc false
  @derive Jason.Encoder
  defstruct [:context, :count, :value]

  @type t :: %__MODULE__{
          context: String.t() | nil,
          count: integer() | nil,
          value: [VidarAPI.Model.Position.t()] | nil
        }
  alias VidarAPI.Deserializer

  def decode(value) do
    value |> Deserializer.deserialize(:value, :list, VidarAPI.Model.Position)
  end
end
