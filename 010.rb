#!/usr/bin/env ruby -w
 
limit = 1e8
sieve_bound = ((limit-1) / 2).to_i
sieve = []
(0...sieve_bound).each do |num|
  sieve << false
end  
crosslimit = (Math.sqrt(limit).to_i-1) / 2

(1...crosslimit+1).each do |i|
  unless sieve[i-1] == true
    (2*i*(i+1)..sieve_bound).step(2*i+1) do |j|
      sieve[j-1] = true
    end  
  end  
end  

sum = 2
max = 0
sieve_bound.downto(1) do |i|
  if sieve[i-1] == false
    max=(2*i+1) # because the array starts with 0, not 1
    break
  end  
end  


p max

