class Link < ActiveRecord::Base
  attr_accessible :catid, :content, :gmt_created, :gmt_modified, :id, :name, :url, :view
end
