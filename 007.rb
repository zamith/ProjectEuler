#!/usr/bin/env ruby -w

#n=12
#result=[]
#
#if n % 2 == 0
#  lastFactor=2
#  n=n / 2
#  result << 2
#  while n % 2==0
#    result << 2
#    n=n / 2
#  end
#else
#  lastFactor=1
#end
#
#factor=3
#maxFactor= Math.sqrt(n)
#while n>1 and factor<=maxFactor
#  if n % factor==0
#    n=n / factor
#    lastFactor=factor
#    result << factor
#    while n % factor==0
#      result << factor
#      n=n / factor
#    end
#    maxFactor=Math.sqrt(n)
#  end
#  factor=factor+2
#end
#result << factor
#
#p result

def isPrime n
  if n==1 
    return false
  elsif n<4 
    return true 
  elsif n % 2==0 
    return false
  elsif n<9 
    return true
  elsif n % 3==0 
    return false
  else
    r=Math.sqrt(n).to_i
    f=5
    while f<=r
      return false if n % f==0
      return false if n % (f+2)==0
      f=f+6
    end   
  end
    
  return true
end  

finished = false
current_num=1
counter=1
while(!finished)
  current_num+=2
  counter+=1 if isPrime(current_num)
  finished=true if counter == 10001
end  

p current_num

