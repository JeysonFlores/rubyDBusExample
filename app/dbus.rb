require "dbus"
require "sqlite3"
require "pstore"

require_relative "interfaces/palette"
require_relative "models/palette"


bus = DBus::SessionBus.instance
service = bus.request_service("com.github.jeysonflores.Chroma")

store = PStore.new("data_file.pstore")

myobj = Palette.new("/com/github/jeysonflores/Chroma/Palette")
myobj.setDB store
service.export(myobj)

puts "Services listening on com.github.jeysonflores.Chroma"
main = DBus::Main.new
main << bus
main.run
