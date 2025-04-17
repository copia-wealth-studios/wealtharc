defmodule VidarAPI.Model.PortfolioType do
  @moduledoc false
  @derive Jason.Encoder
  defstruct []
  @type t :: %__MODULE__{}
  def decode(value) do
    value
  end
end
