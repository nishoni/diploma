class XmlItem < ApplicationRecord
  serialize :aliases, Array
  serialize :roles, Array
end
