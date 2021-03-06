class Article < ActiveRecord::Base
  belongs_to :user
	has_many :taggings
	has_many :tags, through: :taggings
  scope :rubyOnRails, -> { where(kype: "Ruby on Rails") }
  scope :lifeEvents, -> { where(kype: "lifeEvents") }
  scope :cocoaSwift, -> { where(kype: "cocoaSwift") }

	def self.tagged_with(name)
	  Tag.find_by_name!(name).articles
	end

	def self.tag_counts
	  Tag.select("tags.id, tags.name,count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
	end

	def tag_list
	  tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  self.tags = names.split(",").map do |n|
	    Tag.where(name: n.strip).first_or_create!
	  end
end
end
