local is  = require('pl.test').asserteq
local seq = require('pl.seq')
local SkewHeap = require 'skewheap'

local q = SkewHeap.new()

-- initial state
is(q.root, nil)
is(q:items(), 0)
is(q:is_empty(), true)
print("ok - initial state")

-- insertion
expected = 0
shuffled = seq.copy(seq.random(20, 1, 20))
ordered  = seq.copy(seq.sort(shuffled))

for i in shuffled.iterate do
  actual = q:put(i)
  expected = expected + 1
  is(actual, expected)
  is(q:is_empty(), false)
end
print("ok - insertion")

-- extraction
for expected in ordered.iterate do
  actual = q:take()
  is(actual, expected)
  is(q:items(), 20 - expected)
end

is(q:items(), 0)
is(q:is_empty(), true)
print("ok - extraction")

-- insert and extract multiple items at a time
is(q:put(table.unpack(shuffled)), 20)
is({q:take(20)}, ordered)
print("ok - batch insertion and extraction")

-- merging
a = SkewHeap.new()
b = SkewHeap.new()

for _, i in ipairs(shuffled:slice(1, 10)) do a:put(i) end
for _, i in ipairs(shuffled:slice(11, 20)) do b:put(i) end

c = a:merge(b) -- merge a and b
is(c:items(), 20) -- c has 20 items (10 + 10)

-- c contains all elements from both a and b
for i in ordered.iterate do
  is(c:take(), i)
end

is(a:items(), 10) -- a remains intact
is(b:items(), 10) -- b remains intact
print("ok - merging")
