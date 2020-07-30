# PRINT_QUERIES=true rspec spec/01_sql_object_spec.rb

require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  
  def self.columns
    columns = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{self.table_name}
      LIMIT 0;
    SQL
      columns.flatten.map{|col| col.to_sym }
  end

  def self.finalize!
    
    self.columns.each do |name|
				define_method(name) do
					self.attributes[name]
				end
			
				define_method("#{name}=") do |value|
					self.attributes[name] = value
				end
			end
  end

  def self.table_name=(table_name)
    table_name = "#{table_name}".downcase + "s"
    # inflect.irregular 'human', 'humans'
    # inflect.irregular 'octopus', 'octopi'
    #@table_name = table_name
  end

  def self.table_name
    "#{name}".downcase + "s" 
  end

  def self.all
      results = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{self.table_name}
      SQL
      self.parse_all(results)
  end

  def self.parse_all(results)
    results.map { |hash| self.new(hash)}
  end

  def self.find(id)
    fetch = DBConnection.execute(<<-SQL, id)
      SELECT *
      FROM #{self.table_name}
      WHERE id = ?;
    SQL
      obj = self.parse_all(fetch)
      return nil if obj.nil?
      obj.first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
        attr_sym = attr_name.to_sym
      if !self.class.columns.include?(attr_sym)
          raise "unknown attribute '#{attr_name}'"
      else
          self.send("#{attr_name}=", value)
      end
    end
  end

  def attributes
    return @attributes = {} if @attributes == false || @attributes.nil?
    return @attributes
  end

  
  def attribute_values
      vals = []
      @attributes.map{|att, val| vals << val}  
      vals
      
    end
    
  def insert
      columns = DBConnection.execute2(<<-SQL)
          SELECT *
          FROM #{self.class.table_name}
          LIMIT 0;
      SQL
       columns
     
      result = DBConnection.execute(<<-SQL, attribute_values.flatten)
        INSERT INTO
            #{self.class.table_name} (id, name, owner_id)
        VALUES
            (?, ?, ?)
      SQL
      self.result.last_insert_row_id
      
  end

  def update
      DBConnection.execute(<<-SQL, attribute_values, id)
        UPDATE #{self.class.table_name}
        SET #{self.class.columns}
        WHERE id = ?
      SQL
  end

  def save
    # ...
  end
end
