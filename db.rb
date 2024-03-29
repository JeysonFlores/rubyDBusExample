require "sqlite3"

# Open a database
db = SQLite3::Database.new "test.db"

# Create a table
rows = db.execute <<-SQL
  create table if not exists numbers (
    name varchar(30),
    val int
  );
SQL

# Execute a few inserts
{
  "one" => 1,
  "two" => 2,
}.each do |pair|
  db.execute "insert into numbers values ( ?, ? )", pair
end

# Find a few rows
db.execute( "select * from numbers" ) do |row|
  p row
end

# Create another table with multiple columns

db.execute <<-SQL
  create table if not exists students (
    name varchar(50),
    email varchar(50),
    grade varchar(5),
    blog varchar(50)
  );
SQL

# Execute inserts with parameter markers
db.execute("INSERT INTO students (name, email, grade, blog) 
            VALUES (?, ?, ?, ?)", ["Jane", "me@janedoe.com", "A", "http://blog.janedoe.com"])

db.execute( "select * from students" ) do |row|
  p row
end

db.execute 'INSERT INTO palettes (id, name, desc) VALUES (NULL, ?, ?);', ["Prueba", "Siono"]