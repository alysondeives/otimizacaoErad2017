#!/bin/bash
gcc -o programa 02_Matriz_Convencional_Funcoes_Separadas.c -fopenmp
source ../default.sh
mkdir Perf
for ((j=1; j <= $TAM; j++))
do
	echo "Executando Multiplicacao $j..."
	perf stat -e LLC-loads,LLC-load-misses,LLC-stores,LLC-prefetches ./programa $ORDEM $ORDEM &> Perf_multiplicacao_$j.txt
	mv Perf_multiplicacao_$j.txt Perf
done
rm programa

