defmodule Secrets do
  @moduledoc """
  an encryption device that works by performing transformations on data.
  """

  def secret_add(secret) do
    fn a -> a + secret end
  end

  def secret_substract(secret) do
    fn a -> a - secret end
  end

  def secret_multiply(secret) do
    fn a -> a * secret end
  end

  def secret_divide(secret) do
    fn a -> a / secret end
  end

  def secret_and(secret) do
    fn a -> Bitwise.&&&(a, secret) end
  end

  def secret_xor(secret) do
    fn a -> Bitwise.^^^(a, secret) end
  end

  def secret_combine(fn1, fn2) do
    fn a -> a |> fn1.() |> fn2.() end
  end
end
