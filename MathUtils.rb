#!/usr/bin/env ruby -w

module MathUtils
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
