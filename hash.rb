require 'benchmark'

puts "USING RUBY #{RUBY_VERSION} p#{RUBY_PATCHLEVEL} (RELEASED #{RUBY_RELEASE_DATE})"

n = 1000000

puts "Injecting data into array of hashes"
Benchmark.bm do |b|
  ary = nil
  # Use Array.each to inject into it's child hashes
  b.report("each") {
    n.times do
      ary = [{},{},{}]
      ary.each {|h| h["hi"] = "low"}
    end
  }
  # Use Array.collect to inject into it's child hashes
  b.report("collect") {
    n.times do
      ary = [{},{},{}]
      ary.collect {|h| h["hi"] = "low"}
    end
  }
  # Use Array.map to inject into it's child hashes
  b.report("map") {
    n.times do
      ary = [{},{},{}]
      ary.map {|h| h["hi"] = "low"}
    end
  }
end

