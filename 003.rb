#!/usr/bin/env ruby -w

n=25

if n % 2 == 0
  lastFactor=2
  n=n / 2
  while n % 2==0
    n=n / 2
  end
else
  lastFactor=1
end

factor=3
maxFactor= Math.sqrt(n).to_i
while n>1 and factor<=maxFactor
  if n % factor==0
    n=n / factor
    lastFactor=factor
    while n % factor==0
      n=n / factor
    end
    maxFactor=Math.sqrt(n).to_i
  end
  factor=factor+2
end

if n == 1
  p lastFactor
else
  p n
end  
    
