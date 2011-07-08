#!/usr/bin/env ruby -w

limit=100

sum = limit*(limit+1)/2
sum_square = (2*limit+1)*(limit+1)*limit/6

square_sum = sum**2
p square_sum - sum_square