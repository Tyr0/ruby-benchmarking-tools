require 'benchmark'

puts "USING RUBY #{RUBY_VERSION} p#{RUBY_PATCHLEVEL} (RELEASED #{RUBY_RELEASE_DATE})"

n = 1000000

puts "comparing ints with range"
x = 1000
y = 2000
z = 1500
Benchmark.bm do |b|
  b.report("comparison") {
    n.times do
      (z >= x && z < y)
    end
  }
  b.report("include?") {
    n.times do
      (x...y).include?(z)
    end
  }
  b.report("between?") {
    n.times do
      z.between?(x, y)
    end
  }
  if (x...y).respond_to?(:cover?)
    b.report("cover?") {
      n.times do
        (x...y).cover?(z)
      end
    }
  else
    puts "Ruby #{RUBY_VERSION} does not support Range.cover?()"
  end
end
