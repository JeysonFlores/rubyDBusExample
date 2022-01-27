require "pstore"
require "dbus"

#DBus::ErrorMessage.

class SomeObj
    attr_reader :data, :data2
    def initialize(data, data2)
        @data = data
        @data2 = data2
    end
end

id = rand(1000000000)

store = PStore.new("data_file.pstore")
store.transaction do  # begin transaction
  # load some data into the store...
  #someobj = SomeObj.new("Some string", 2)
  #store[:some_obj] = someobj
  print id
  some_obj = store[id.to_s.to_sym]
  if some_obj == nil
    puts "XD its null"
  else
    puts "It's not null"
  end
end   