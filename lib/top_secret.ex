defmodule TopSecret do
  def to_ast(string) do
    {:ok, quoted_data} = Code.string_to_quoted(string)
    quoted_data
  end

  def decode_secret_message_part({opr, _, args} = ast, acc)
      when opr == :def or opr == :defp do
    {fn_name, fn_args} = get_function_name_and_args(args)
    arity = length(fn_args)
    message = String.slice(to_string(fn_name), 0, arity)
    {ast, [message | acc]}
  end

  def decode_secret_message_part(ast, acc) do
    {ast, acc}
  end

  defp get_function_name_and_args(def_args) do
    case def_args do
      [{:when, _, args} | _] -> get_function_name_and_args(args)
      [{name, _, args} | _] when is_list(args) -> {name, args}
      [{name, _, args} | _] when is_atom(args) -> {name, []}
    end
  end

  def decode_secret_message(string) do
    ast = to_ast(string)
    {_, acc} = Macro.prewalk(ast, [], &decode_secret_message_part/2)

    acc
    |> Enum.reverse()
    |> Enum.join("")
  end
end
