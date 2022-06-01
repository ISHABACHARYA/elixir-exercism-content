defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    def exception(value) do
      case value do
        [] -> %StackUnderflowError{}
        _ -> %StackUnderflowError{message: "stack underflow occurred, context: " <> value}
      end
    end
  end

  def divide([_]) do
    raise StackUnderflowError, "when dividing"
  end

  def divide([]) do
    raise StackUnderflowError, "when dividing"
  end

  def divide([0, _]) do
    raise StackUnderflowError
  end

  def divide([a, b]), do: b / a
end
