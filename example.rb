require 'benchmark'

puts format('%dM', `ps -o rss= -p #{Process.pid}`.to_i)

def example_one
  num_rows = 100_000
  num_cols = 10
  data = Array.new(num_rows) { Array.new(num_cols) { 'x' * 1000 } }

  GC.disable # This is the good stuff

  time = Benchmark.realtime do
    csv = data.map { |row| row.join(',') }.join('\n')
  end

  puts time.round(2)
end
