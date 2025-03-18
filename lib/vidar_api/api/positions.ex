# NOTE: This file is auto generated by OpenAPI Generator 7.12.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VidarAPI.Api.Positions do
  @moduledoc """
  API calls for all endpoints tagged `Positions`.
  """

  alias VidarAPI.Connection
  import VidarAPI.RequestBuilder

  @doc """
  Get all positions
  This endpoint uses OData. All operators are supported.    To make it as fast as possible please select the smallest required data set.    Examples:    Selecting data set: /Positions?$select=portfolioId, instrumentId, statementDate     Filtering data set: /Positions?$filter=portfolioId eq 20146

  ### Parameters

  - `connection` (VidarAPI.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:select` (String.t): Limits the properties returned in the result.
    - `:expand` (String.t): Indicates the related entities to be represented inline. The maximum depth is 2.
    - `:filter` (String.t): Restricts the set of items returned. The maximum number of expressions is 100. The allowed functions are: allfunctions.
    - `:orderby` (String.t): Specifies the order in which items are returned. The maximum number of expressions is 5.
    - `:top` (integer()): Limits the number of items returned from a collection. The maximum value is 1000.
    - `:skip` (integer()): Excludes the specified number of items of the queried collection from the result.
    - `:count` (boolean()): Indicates whether the total count of items within a collection are returned in the result.

  ### Returns

  - `{:ok, [%Position{}, ...]}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec vversion_api_version_positions(Tesla.Env.client, keyword()) :: {:ok, [VidarAPI.Model.Position.t]} | {:error, Tesla.Env.t}
  def vversion_api_version_positions(connection, opts \\ []) do
    optional_params = %{
      :select => :query,
      :expand => :query,
      :filter => :query,
      :orderby => :query,
      :top => :query,
      :skip => :query,
      :count => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1/Positions")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, VidarAPI.Model.Position}
    ])
  end

  @doc """
  Get position by id
  This endpoint uses OData. All operators are supported.    To make it as fast as possible please select the smallest required data set.    Examples:    Selecting data set: /Positions/{key}?$select=portfolioId, instrumentId, statementDate, quantity, price  

  ### Parameters

  - `connection` (VidarAPI.Connection): Connection to server
  - `key` (integer()): 
  - `opts` (keyword): Optional parameters
    - `:select` (String.t): Limits the properties returned in the result.
    - `:expand` (String.t): Indicates the related entities to be represented inline. The maximum depth is 2.

  ### Returns

  - `{:ok, VidarAPI.Model.Position.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec vversion_api_version_positions_key(Tesla.Env.client, integer(), keyword()) :: {:ok, nil} | {:ok, VidarAPI.Model.Position.t} | {:error, Tesla.Env.t}
  def vversion_api_version_positions_key(connection, key, opts \\ []) do
    optional_params = %{
      :select => :query,
      :expand => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1/Positions/#{key}")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, VidarAPI.Model.Position},
      {404, false}
    ])
  end
end
