#!/usr/bin/env ruby -w

def getFactors n
  initial_n = n
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

  result << n if n>1
  factors = []
  factors_base = []
  result.uniq.each do |prime_factor|
    factors_base << prime_factor
    factors << result.count(prime_factor)
  end  
    
  num_factors = 1 
  factors.each do |exp|
    num_factors*=(exp+1)
  end      
       
  return num_factors  
end

def triangleNumber n
  $last+=n
end  


result=0
k=1
$last=0
while(result <= 500)
  n=triangleNumber k
  result = getFactors n
  k+=1
end  

p n
p result




