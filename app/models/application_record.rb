class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  acts_as_paranoid

  default_scope { order(:created_at) }
end
