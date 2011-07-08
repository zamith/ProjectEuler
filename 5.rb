#!/usr/bin/env ruby -w

def gcd(a, b)
  if b == 0
     return a
  else
     return gcd(b, a%b)
  end   
end    

def lcm(a,b)
  return a/gcd(a,b) * b
end     
 
val=lcm(1,2)
(3..20).each do |num|
  val=lcm(val,num)
end 

p val
 



