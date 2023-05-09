#!/bin/bash

for i in {1..20}
do
    make test >> results.txt
done