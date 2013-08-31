class Post < ActiveRecord::Base
  has_many :relations
  has_many :tags, through: :relations

  validates :title, :presence => true
  validates :body, :presence => true

  def tags_s
  	array = []
  	self.tags.each do |tag|
		array << tag.name
	end
	array.join(",")
  end

  def create_tags(string)
  	self.tags.clear

    return if string.empty?
  	tags = string.split(",")
  	tags.each do |tag|
  		self.tags << Tag.find_or_create_by_name(tag.strip)
  	end
  	self.tags
  end


end
