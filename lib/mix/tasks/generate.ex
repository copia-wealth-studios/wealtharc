defmodule Mix.Tasks.Generate do
  @moduledoc """
  Generates Elixir code from OpenAPI specification.

  This task reads the OpenAPI specification file, uses the OpenAPI generator
  to create Elixir code, and then formats the generated code.
  """
  use Mix.Task

  @openapi_file "priv/v1.json"

  @shortdoc "Generates Elixir code from OpenAPI specification"
  def run(_) do
    Mix.shell().info("Generating Elixir code from OpenAPI specification...")

    # Install dependencies for OpenAPI generator
    System.cmd("npm", ["install"], cd: "priv/openapi_generator")

    case System.cmd(
           "npx",
           [
             "@openapitools/openapi-generator-cli",
             "generate",
             "-g",
             "elixir",
             "-i",
             @openapi_file
           ],
           into: IO.stream(:stdio, :line)
         ) do
      {_, 0} ->
        Mix.Task.run("update_empty_moduledocs")
        Mix.Task.run("format")

        Mix.shell().info("Code generation completed successfully.")

      {_, status} ->
        Mix.raise("Code generation failed with status #{status}")
    end
  end
end
