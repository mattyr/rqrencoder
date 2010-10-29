=begin
  usage: ruby extconf.rb [options ...]
  configure options:
    --with-opt-dir=/path/to/libraries
=end
require 'mkmf'
require 'rbconfig'
$libs = append_library($libs, "supc++")

create_makefile('rqrencoder/RQREncoder')
