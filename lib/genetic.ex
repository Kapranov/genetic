defmodule Genetic do
  @moduledoc false

  def run(fitness_function, genotype, max_fitness, opts \\ []) do
    population = initialize(genotype, opts)

    population
    |> evolve(fitness_function, genotype, max_fitness)
  end

  defp initialize(genotype, opts) do
    population_size = Keyword.get(opts, :population_size, 100)
    for _ <- 1..population_size, do: genotype.()
  end

  defp evolve(population, fitness_function, genotype, max_fitness) do
    population = evaluate(population, fitness_function)
    best =  hd(population)

    IO.write("\rCurrent Best: #{fitness_function.(best)}")

    if fitness_function.(best) do
      best
    else
      population
      |> select()
      |> crossover()
      |> mutation()
      |> evolve(fitness_function, genotype, max_fitness)
    end
  end

  defp evaluate(population, fitness_function) do
    population
    |> Enum.sort_by(fitness_function, &>=/2)
  end

  defp select(population) do
    population
  end

  defp crossover(population) do
    population
  end

  defp mutation(population) do
    population
  end
end
