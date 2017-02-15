#!/bin/bash
gcc -o programa 06_Matriz_Tiling_Loop_Interchange.c -fopenmp
source ../default.sh
NUM_ALG=10
mkdir Perf
for ((i=1; i <= $NUM_ALG; i++))
do
	for ((j=1; j <= $TAM; j++))
	do
		echo "Executando Multiplicacao $i - $j..."
		perf stat -e LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches ./programa $ORDEM $ORDEM $i $BLOCO &> $i.Perf_multiplicacao_$j.txt
		mv $i.Perf_multiplicacao_$j.txt Perf
	done
done
rm programa
