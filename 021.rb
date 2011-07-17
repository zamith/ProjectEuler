#!/usr/bin/env ruby -w

require_relative 'MathUtils'
include MathUtils

def sumArray array
  array.inject(0) {|sum,val|sum+=val}
end  

pairs = []
k=220
while k < 10000
  possible_pair = sumOfProperDivisors(k)
  another_pair = sumOfProperDivisors(possible_pair)
  if k == another_pair && possible_pair != another_pair
    pairs << [another_pair,possible_pair] 
    k=(possible_pair > another_pair) ? possible_pair+1 : another_pair+1
  else
    k+=1  
  end
end 

p sumArray(pairs.flatten) 