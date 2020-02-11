local seq = require('pl.seq')
local t   = require('pl.test')
local SkewHeap = require 'skewheap'

numbers = seq.copy(seq.random(100000, 1, 100000))
batch_size = 2000

function single(items)
  heap = SkewHeap.new()

  for i = 1, items do
    heap:put(numbers[i])
  end

  while not heap:is_empty() do
    heap:take()
  end
end

function batch(items)
  heap = SkewHeap.new()

  for i = 1, items, batch_size do
    heap:put(table.unpack(numbers, i, i + batch_size - 1))
  end

  while not heap:is_empty() do
    heap:take(batch_size)
  end
end

print("Batch size: " .. batch_size)
for _, i in ipairs({10, 100, 1000, 10000, 100000}) do
  local msg1 = string.format("single: insert and retrieve %-7d items", i)
  local msg2 = string.format(" batch: insert and retrieve %-7d items", i)
  t.timer(msg1, 1, single, i)
  t.timer(msg2, 1, batch, i)
end
