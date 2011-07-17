#!/usr/bin/env ruby -w

n=12
result=[]

if n % 2 == 0
  lastFactor=2
  n=n / 2
  result << 2
  while n % 2==0
    result << 2
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
    result << factor
    while n % factor==0
      result << factor
      n=n / factor
    end
    maxFactor=Math.sqrt(n).to_i
  end
  factor=factor+2
end

result << n

p result
