package = "skewheap"
version = "scm-1"

source = {
  url = "https://github.com/sysread/lua-skewheap"
}

description = {
  maintainer = "Jeff Ober <sysread@fastmail.fm>",
  homepage = "https://github.com/sysread/lua-skewheap",
  license = "MIT",
}

dependencies = {
}

build = {
  type = "builtin",
  modules = {
    skewheap = "skewheap.lua"
  }
}
