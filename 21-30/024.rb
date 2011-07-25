#!/usr/bin/env ruby -w

require_relative '../Utils/MathUtils'
include MathUtils

# Based on the course notes of the University of Exeter's Computational Physics class (PHY3134)

values=[0,1,2,3,4,5,6,7,8,9]
$result=[]


def permute(values,start,n)
  if start == n-1
    $result << values.join 
  else  
    (start...n).each do |pos|
      tmp = values[pos]
      
      values[pos] = values[start]
      values[start] = tmp
      
      permute(values,start+1,n)
      
      values[start] = values[pos]
      values[pos] = tmp
    end  
  end
end  

permute(values,0,values.size)
# Because the array starts at 0
$result.sort[999999]