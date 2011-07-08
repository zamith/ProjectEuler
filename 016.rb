#!/usr/bin/env ruby -w

res = (2**1000).to_s.split('').map(&:to_i).inject{|sum,val|sum+=val}
p res