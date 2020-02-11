package = "skewheap"
version = "scm-1"

source = {
  url = ""
}

description = {
  maintainer = "Jeff Ober <sysread@fastmail.fm>",
  homepage = "",
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
