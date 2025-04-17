defmodule Mix.Tasks.UpdateEmptyModuledocs do
  @moduledoc """
  Updates @moduledoc attributes in lib/vidar_api modules.

  This task traverses all .ex files in the lib/vidar_api directory and
  replaces empty @moduledoc attributes with @moduledoc false.
  """
  use Mix.Task

  @shortdoc "Updates empty @moduledoc attributes in lib/vidar_api"
  def run(_) do
    Mix.shell().info("Updating @moduledoc attributes...")

    "lib/vidar_api/**/*.ex"
    |> Path.wildcard()
    |> Enum.each(&process_file/1)

    Mix.shell().info("@moduledoc attributes updated successfully.")
  end

  defp process_file(file_path) do
    file_path
    |> File.read!()
    |> Code.string_to_quoted!()
    |> traverse_ast()
    |> case do
      {:ok, updated_ast} ->
        updated_code = Macro.to_string(updated_ast)
        File.write!(file_path, updated_code)
        Mix.shell().info("Updated #{file_path}")

      :no_change ->
        Mix.shell().info("No changes needed for #{file_path}")
    end
  end

  defp traverse_ast(ast) do
    {updated_ast, changed} = Macro.prewalk(ast, false, &update_moduledoc/2)
    if changed, do: {:ok, updated_ast}, else: :no_change
  end

  defp update_moduledoc({:@, meta, [{:moduledoc, _, [content]}]}, _changed)
       when content in [
              "",
              ~s(""),
              ~s(''),
              """

              """
            ] do
    updated_node = {:@, meta, [{:moduledoc, meta, [false]}]}
    {updated_node, true}
  end

  defp update_moduledoc(node, changed), do: {node, changed}
end
