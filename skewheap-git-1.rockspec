package = "skewheap"
version = "git-1"

source = {
  url = "https://github.com/sysread/lua-skewheap"
}

description = {
  summary    = "A self-adjusting, mergeable min heap",
  maintainer = "Jeff Ober <sysread@fastmail.fm>",
  homepage   = "https://github.com/sysread/lua-skewheap",
  license    = "MIT",
}

dependencies = {
}

build = {
  type = "builtin",
  modules = {
    skewheap = "skewheap.lua"
  }
}
