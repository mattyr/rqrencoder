=begin
  usage: ruby extconf.rb [options ...]
  configure options:
    --with-opt-dir=/path/to/libraries
    --with-qrencode-include=dir
    --with-qrencode-lib=dir
=end
require 'mkmf'
require 'rbconfig'
#$libs = append_library($libs, "supc++")

dir_config('qrencode')

$LDFLAGS = ENV["LDFLAGS"].to_s  + " -lqrencode"

create_makefile('rqrencoder/RQREncoder')
