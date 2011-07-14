#!/usr/bin/env ruby -w

require_relative 'MathUtils'
include MathUtils

res = factorial(100).to_s.split('').map(&:to_i).inject {|sum,val| sum+=val}
p res