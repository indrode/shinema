class Movie < ActiveRecord::Base
  validates_uniqueness_of :meta_id, :scope => :user_id
  validates_presence_of :title, :rating

  belongs_to :user

  def self.import_movies!(arr)
    # arr is in format:
    # [ [ {:title => "title", :rating => (rating/20.0)} ] ]

    arr.each do |a|
      hash = a[0]
      Movie.create(:title => hash[:title].rstrip, :rating => (hash[:rating].to_f * 20).to_i)
    end
  end
end
