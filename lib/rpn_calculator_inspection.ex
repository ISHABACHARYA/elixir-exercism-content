defmodule RPNCalculatorInspection do
  def start_reliability_check(calculator, input) do
    %{pid: spawn_link(fn -> calculator.(input) end), input: input}
  end

  def await_reliability_check_result(%{pid: pid, input: input}, results) do
    receive do
      {:EXIT, ^pid, :normal} ->
        Map.put(results, input, :ok)

      {:EXIT, ^pid, _} ->
        Map.put(results, input, :error)
    after
      100 -> Map.put(results, input, :timeout)
    end
  end

  def reliability_check(calculator, inputs) do
    old_flag = Process.flag(:trap_exit, true)

    result =
      Enum.map(inputs, fn x -> start_reliability_check(calculator, x) end)
      |> Enum.reduce(%{}, &await_reliability_check_result/2)

    Process.flag(:trap_exit, old_flag)
    result
  end

  def correctness_check(calculator, inputs) do
    inputs
    |> Enum.map(fn x -> Task.async(fn -> calculator.(x) end) end)
    |> Enum.map(fn task -> Task.await(task, 100) end)
  end
end
