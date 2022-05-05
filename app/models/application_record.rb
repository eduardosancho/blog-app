class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def print_count(count)
    return count unless count.nil?

    0
  end
end
