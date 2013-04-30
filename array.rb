require 'benchmark'

puts "USING RUBY #{RUBY_VERSION} p#{RUBY_PATCHLEVEL} (RELEASED #{RUBY_RELEASE_DATE})"

n = 1000000
a = [0,1,2,3,4,5,6,7,8,9]

puts "Collecting data"
Benchmark.bm do |b|
  # Array.collect
  b.report("collect proc") {n.times do; a.collect(&:to_s); end}
  b.report("collect block") {n.times do; a.collect {|x|x.to_s}; end}
  # Array.map (although it's an alias to Array.collect)
  b.report("map proc") {n.times do; a.map(&:to_s); end}
  b.report("map block") {n.times do; a.map {|x|x.to_s}; end}
  # Array.inject
  b.report("inject") {n.times do; a.inject([]) {|x,y|x.push(y.to_s)}; end}
end
