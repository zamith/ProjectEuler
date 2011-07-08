#!/usr/bin/env ruby -w

def factorial n
  (1..n).inject do |sum,num|
    sum*=num
  end  
end  

def catalanNumber n
  factorial(n<<1)/(factorial(n+1)*factorial(n))
end  

def c (n,k)
  factorial(n)/(factorial(k)*factorial(n-k))
end  

n=20

p c 2*n,n
