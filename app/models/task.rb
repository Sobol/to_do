class Task < ActiveRecord::Base
  attr_accessible :id, :name, :counter, :created_at, :updated_at
end
