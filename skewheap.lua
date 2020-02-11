--------------------------------------------------------------------------------
-- Node class (internal)
--------------------------------------------------------------------------------
VALUE = 1
LEFT  = 2
RIGHT = 3

function Node(value, left, right)
  return {value, left, right}
end

local function merge(a, b)
  if not a then return Node(table.unpack(b or {})) end
  if not b then return Node(table.unpack(a or {})) end
  if b[VALUE] < a[VALUE] then return merge(b, a) end
  return Node(a[VALUE], merge(b, a[RIGHT]), a[LEFT])
end

--------------------------------------------------------------------------------
-- SkewHeap class
--------------------------------------------------------------------------------
local SkewHeap = {}
SkewHeap.__index = SkewHeap

function SkewHeap.new()
  local self = {}
  setmetatable(self, SkewHeap)
  self.size = 0
  self.root = nil
  return self
end

function SkewHeap:items()
  return self.size
end

function SkewHeap:is_empty()
  return self.size == 0
end

function SkewHeap:put(...)
  for _, item in ipairs{...} do
    self.root = merge(self.root, Node(item, nil, nil))
    self.size = self.size + 1
  end

  return self.size
end

function SkewHeap:take(...)
  local count = 1
  local items = {}

  if select('#', ...) > 0 then
    count = select(1, ...)
  end

  for _ = 1, count do
    if self.root then
      local item = self.root[VALUE]
      self.root = merge(self.root[LEFT], self.root[RIGHT])
      self.size = self.size - 1
      table.insert(items, item)
    else
      break
    end
  end

  return table.unpack(items)
end

function SkewHeap:peek()
  if not self.root then
    return
  else
    return self.root[VALUE]
  end
end

function SkewHeap:merge(other)
  local newheap = SkewHeap.new()
  newheap.root = merge(self.root, other.root)
  newheap.size = self.size + other.size
  return newheap
end

return SkewHeap
