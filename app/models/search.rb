class Search < ApplicationRecord
  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end
end
