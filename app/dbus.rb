require "dbus"
require "sqlite3"

require_relative "interfaces/palette"
require_relative "models/palette"

db = SQLite3::Database.new "../test.db"

bus = DBus::SessionBus.instance
service = bus.request_service("com.github.jeysonflores.Chroma")

myobjTable = PaletteTable.new(db)
myobj = Palette.new("/com/github/jeysonflores/Chroma/Palette")
myobj.setDB myobjTable
service.export(myobj)

puts "listening"
main = DBus::Main.new
main << bus
main.run
