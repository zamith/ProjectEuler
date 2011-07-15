#!/usr/bin/env ruby -w

class Tree
  class Node
    attr_accessor :left, :right, :visited_right, :visited_left, :sum_until_now

    def initialize( key, left=nil, right=nil )
      @key = key
      @left, @right = left, right
      @visited_left = false
      @visited_right = false
      @sum_until_now = @key # The sum of all keys in the path here (no need to sum everytime)
    end

    def reset_sum
      @sum_until_now = @key
    end  

    def leaf?
      @left.nil? && @right.nil?
    end
    
    def to_s
      @key.to_s
    end  
  end
  
  attr_reader :levels_hash, :current_level, :current_level_array, :root
  
  def initialize
    @levels_hash = {}
    @current_level = 1
    @current_level_array = []
    @final_hash = {}
  end  
  
  def insert(key)
    if @current_level_array.size < @current_level
      node = Node.new key
      @root = node if @current_level == 1
      @current_level_array << node
    else
      @levels_hash[@current_level] = @current_level_array
      @current_level+=1
      @current_level_array = [(Node.new key)]
    end   
  end  
  
  def flush
    @levels_hash[@current_level] = @current_level_array # Populate last level
    
    # Populate left and right values in each node
    (1..@levels_hash.size).each do |level| 
      (0...@levels_hash[level].size).each do |i|
        @levels_hash[level][i].left = @levels_hash[level+1][i] if @levels_hash[level+1] && @levels_hash[level+1][i]
        @levels_hash[level][i].right = @levels_hash[level+1][i+1] if @levels_hash[level+1] && @levels_hash[level+1][i+1]
      end  
    end  
    
  end 
   
  def getMaxSum
    max=0
    nrLeafs=0
    max_array=[]
    stack = [@root]
    while stack.size > 0
      last = stack.last
      
      # If hasn't gone left, go left
      if last.visited_left == false
        stack << last.left
        last.left.sum_until_now += last.sum_until_now
        last.visited_left = true
      # if right is still to check, go right
      elsif last.visited_right == false
        stack << last.right
        last.right.sum_until_now += last.sum_until_now 
        last.visited_right = true
      #otherwise, go up!  
      else
        last.reset_sum
        last.visited_right = false
        last.visited_left = false
        stack.pop  
      end
      
      last = stack.last
      # If the new top of the stack is a leaf, reached the end of the line (check if is max)
      if last && last.leaf?
        if last.sum_until_now > max
          max = last.sum_until_now 
        end  
        last.reset_sum
        stack.pop
      end  
    end 
    
    return max
  end  
  
end  