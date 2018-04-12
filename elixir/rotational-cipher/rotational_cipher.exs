defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
      |> :binary.bin_to_list
      |> Enum.map(&(shift_char(&1, shift)))
      |> :binary.list_to_bin
  end

  defp shift_char(char, shift) do
    cond do
      char in ?A..?Z -> shift_char(char, shift, ?A)
      char in ?a..?z -> shift_char(char, shift, ?a)
      true -> char
    end
  end

  defp shift_char(char, shift, base) do
    rem(char - base + shift, 26) + base
  end
end
