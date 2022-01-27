require "dbus"

class Palette < DBus::Object
  def setDB(db)
    @db = db
    puts @db.class
  end

  dbus_interface "com.github.jeysonflores.Chroma.Palette" do
    dbus_method :Create, "in name:s, in desc:s" do |name, desc|
      puts "Creating Palette with name #{name} and with description: #{desc}"
      id = rand(1000000000)
      store = PStore.new("data_file.pstore")
      store.transaction do
        print id
        store[id.to_s.to_sym] = { "name": name, "desc": desc }
        some_obj = store[id.to_s.to_sym]
        if some_obj == nil
          puts "XD its null"
        else
          puts "It's not null"
        end
      end   
    end

    dbus_method :Modify, "in id:i, in name:s, in desc:s" do |id, name, desc|
      puts "Modifying the palette #{id}. New name is #{name} and new desc. is #{desc}"
    end

    dbus_method :Delete, "in id:i" do |id|
      puts "Deleting the palette #{id}"
    end

    dbus_method :GetAll, "out palettes:s" do
      puts "Retrieving the palettes..."
      ["Exito"]
    end

    dbus_signal :PaletteCreated, "name:s, desc:s"
    dbus_signal :PaletteDeleted, "id:i"
    dbus_signal :PaletteModified, "id:i, name:s, desc:s"
  end
end
