genotype = fn -> for _ <- 1..42, do: Enum.random(0..1) end
max_fitness = 42
fitness_function = fn chromosome -> Enum.sum(chromosome) end
soln = Genetic.run(fitness_function, genotype, max_fitness)

IO.write("\n")
IO.inspect(soln)
