#!/usr/bin/env ruby -w

$target=999

def sumDivisibleBy n
  p = $target / n
  n * (p * (p+1)) / 2
end  

p sumDivisibleBy(3)+sumDivisibleBy(5)-sumDivisibleBy(5*3)
