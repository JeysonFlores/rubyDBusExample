class PaletteTable
  def initialize(db)
    @db = db
    @db.execute <<-SQL
            CREATE TABLE IF NOT EXISTS palettes (
                id INTEGER NOT NULL PRIMARY KEY,
                name TEXT,
                desc TEXT
            );
            SQL
  end

  def insertNew(name, desc)
    puts "Inserting new palette..."
    @db.execute 'INSERT INTO palettes (id, name, desc) VALUES (NULL, "a", "asas");'
    puts "Palette saved :D"
  end
end
