#!/bin/bash

calculate_average() {
    local iterations=$1
    local thread_qty=$2
    local array_size=$3

    local total_time=0

    for ((i=1; i<=iterations; i++))
    do
        execution_time=$(./contention $thread_qty $array_size)
        total_time=$(echo "$total_time + $execution_time" | bc)
    done

    average_time=$(echo "scale=4; $total_time / $iterations" | bc)
    echo "$thread_qty threads e $array_size posições no array: $average_time"
}

run_test_suite() {
  local if_qty=$1
  echo "Rodando suíte de testes com $if_qty if(s)."

  # 2 threads
  calculate_average 30 2 10
  calculate_average 30 2 10000
  calculate_average 30 2 10000000

  # 8 threads
  calculate_average 30 8 10
  calculate_average 30 8 10000
  calculate_average 30 8 10000000

  # 16 threads
  calculate_average 30 16 10
  calculate_average 30 16 10000
  calculate_average 30 16 10000000
}
make IF=0
run_test_suite 0

make IF=1
run_test_suite 1

make IF=5
run_test_suite 5

make IF=10
run_test_suite 10