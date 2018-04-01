defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    do_count(strand, nucleotide)
  end

  defp do_count([], _), do: 0
  defp do_count([char|rest], char), do: do_count(rest, char) + 1
  defp do_count([_|rest], char), do: do_count(rest, char)

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    do_histogram(strand)
  end

  defp do_histogram([]), do: %{?A => 0, ?T => 0, ?C => 0, ?G => 0}

  defp do_histogram([head|rest]) do
    Map.update(do_histogram(rest), head, 0, &(&1 + 1))
  end
end
