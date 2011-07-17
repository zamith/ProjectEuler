#!/usr/bin/env ruby -w

module MathUtils
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
    factors = result.uniq + [1] - [initial_n]
    result.uniq.each do |prime_factor|
      k=2
      while (new_factor = prime_factor * k) < initial_n
        factors << new_factor if initial_n % new_factor == 0
        k+=1 
      end
    end  

    return factors.uniq  
  end
  
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
end
