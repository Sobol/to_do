class Task < ActiveRecord::Base
  attr_accessible :id, :name, :created_at, :updated_at
end
