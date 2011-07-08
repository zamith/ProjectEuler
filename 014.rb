#!/usr/bin/env ruby -w

def getNext n
  if n%2==0 
    n>>1 
  else
    n+=(n<<1)+1
  end  
end

def sequenceSartingWith n
  seq=[n]
  while n!=1
    n=getNext n
    seq << n
  end
  seq
end

max=0
res=0
(1..1000000).each do |start_value|
  seq = sequenceSartingWith start_value
  if seq.size > max
    res = start_value 
    max = seq.size
  end   
end

p res
