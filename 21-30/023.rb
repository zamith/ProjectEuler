#!/usr/bin/env ruby -w

require_relative '../Utils/MathUtils'
include MathUtils

# The upper bound for numbers that cannot be expressed as the sum of two numbers is actually 20161
n = 20161

# Get all abundant numbers to n, and split them by odd and even
abundant = abundantNumbersUntil n
even_abundant = odd_abundant = []
abundant.each do |num|
  if num % 2 == 0
    even_abundant << num
  else
    odd_abundant << num
  end
end

# Populate our abundant number filter with all 0's
abundant_nums_filter = []
(0..n).each do |pos|
  abundant_nums_filter[pos] = 0
end


# All even numbers above 48 are abundant, and the ones below are on this list...
[24,30,32,36,38,40,42,44].each do |val|
  abundant_nums_filter[val] = 1
end

(48..n).step(2) do |val|
  abundant_nums_filter[val] = 1  
end

# We now have all even abundant numbers, and because the only way to get
# an odd number is by the sum of an odd and an even number...
current_num=0
(0..even_abundant.size-1).each do |i|
  (0..odd_abundant.size-1).each do |j|
    current_num = even_abundant[i] + odd_abundant[j]
    abundant_nums_filter[current_num] = 1 if current_num < n
  end
end

# Our filter is ready (with all the numbers that are sums of abundant numbers set to 1), 
# just sum them all!
sum_abundants=0
(1..n).each do |pos|
  sum_abundants+=pos if abundant_nums_filter[pos] == 1
end

# The sum of all the numbers from 0 to n
total_sum = (0..n).inject(0){|sum,val| sum+=val}

p total_sum - sum_abundants
