# Ruby Optimisation

## What Makes Ruby Code Slow

* For Ruby code, algorithmic tweaking only amounts to a max of 3% performance.

* Run `rbenv install -k`. The -k options keeps sources in rbenv's directory after compilation.

* Sample program

```ruby
require 'benchmark'

num_rows = 100000
num_cols = 10
data = Array.new(num_rows) {Array.new(num_cols) {'x'*1000}}

GC.disable # This is the good stuff

time = Benchmark.realtime do 
    csv = data.map { |row| row.join(',')}.join('\n')
end

puts time.round(2)
```

* Fundamental problem: Too much memory being used and Ruby GC is slow

* Print the process's Resident Set Size - The portion of memory, held in RAM

```ruby
puts "%dM" % `ps -o rss= -p #{Process.pid}`.to_i
```

* Memory consumption and gargabe collection are why Ruby is slow.

* Ruby has a significant memory overhead.

* The raw performance of all modern Ruby interpreters are roughly the same.

### Optimisation Process 1

1. Look and think about how much memory each line and function call takes.

2. Check for memory copying or extra memory allocation.

3. Check for memory-inefficient operations.

### Optimisation Takeaways

* The 80-20 rule of Ruby performance: 80% comes from memory

* Optimise memory first

* Memory optimisation is easy: just review, think, and rewrite

* A memory-optimised program has the same performance in any modern Ruby 

### Performance Mindset

* Ruby optimisation is more about rethinking what the code does and less about tools.

* The major skill to lean is rather the right way of thinking about performance.

#### Things to keep in mind

1. Is Ruby the right tool to solve my problem?

Ruby is a general purpose p;rogramming languagfe, but that doensn't mean
you should use it to solve all your problems.

Ruby is NOT good at big data processing. Big data needs big memory: we want to avoid big memory.

2. How much memory will my code use?
Less memory used = less work Ruby GC has to do = improved performance.
Example: line-by-line data processing and in-place string manipulations.

3. What is the raw performance of this code?
least important question, and should be left for the end. Involves analysing the algorithmic complexity.
