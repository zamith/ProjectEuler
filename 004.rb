#!/usr/bin/env ruby -w

def isPalindrome str
  return str == str.reverse
end  

max = 0
999.downto 100 do |first_set|
  999.downto 100 do |second_set|
     result=first_set*second_set
     break if result <= max
     max = result if result > max && isPalindrome(result.to_s)     
  end
end    

p max
