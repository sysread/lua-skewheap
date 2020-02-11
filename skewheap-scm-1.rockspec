rockspec_format = "3.0"

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

build_dependencies = {
  "penlight >= 1.7.0-1",
}

build = {
  type = "builtin",
  modules = {
    skewheap = "skewheap.lua"
  }
}
