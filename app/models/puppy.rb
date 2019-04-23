class Puppy < ActiveRecord::Base

  # self.get_all_puppies
  # return all puppies as a hash indexed by primary key;
  # each value is itself a hash indexed by the remaining columns (name,breed).
  # Nil values are replaced by an empty string in the output.
  def self.get_all_puppies
    puppies_hash = {}
    self.all.each do |puppy|
      puppies_hash[puppy.id] = \
        { :id => puppy.id, \
          :name => (puppy.name || ""), \
          :breed => (puppy.breed || "")}
    end
    puppies_hash
  end

  # self.get_puppy_by_id(id)
  # return a puppy as a hash indexed by column name (name,breed).
  # Nil values are replaced by an empty string in the output.
  # Returns nil if puppy is not found.
  def self.get_puppy_by_id(id)
    puppy = self.find(id.to_i)
    if puppy
      {:id => puppy.id, :name => (puppy.name || ""), \
        :breed => (puppy.breed || "")}
    else
      nil
    end
  end

  # self.remove_puppy_by_id(id)
  # completely removes puppy with given id from the database
  def self.remove_puppy_by_id(id)
    puppy = self.find(id.to_i)
    if puppy
      puppy.destroy
    end
  end

  # self.new_puppy(name,breed)
  # create a new puppy with specified name and breed. returns the primary
  # key of the created row.
  def self.new_puppy(name,breed)
    puppy = self.create({:name => name, :breed => breed})
    if puppy
      puppy.id
    else
      nil
    end
  end

  # self.update_puppy_by_id(id,puppy_hash)
  # id is the id PK of the puppy to update. puppy_hash is a hash with keys
  # being the column names (name,breed) and values being the new values.
  def self.update_puppy_by_id(id,puppy_hash)
    puppy = self.find(id.to_i)
    if puppy
      puppy.update({:name => puppy_hash[:name], :breed => puppy_hash[:breed]})
    end
  end
end
