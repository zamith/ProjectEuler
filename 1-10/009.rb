#!/usr/bin/env ruby -w

$a=0
$b=0
$c=0
$limit=1000


def findIt
  result = 0
  3.upto(($limit-3)/3) do |a|
    (a+1).upto(($limit-1-a)/2) do |b|
      c = $limit-a-b
      if a*a + b*b == c*c
        $a=a
        $b=b
        $c=c
        return
      end
    end
  end
end


findIt
p $a
p $b
p $c
p $a*$b*$c
