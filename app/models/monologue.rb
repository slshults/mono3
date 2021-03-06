class Monologue < ActiveRecord::Base
  belongs_to :gender
  belongs_to :author
  belongs_to :play

  validates_presence_of :play_id
  validates_presence_of :first_line
  validates_uniqueness_of :first_line, :scope => :play_id

  validates_length_of :location, :maximum=>20, :allow_nil => true
  validates_length_of :first_line, :maximum=>255
  validates_length_of :character, :maximum=>80, :allow_nil => true
  validates_length_of :style, :maximum=>20, :allow_nil => true
  validates_length_of :body_link, :maximum=>255, :allow_nil => true
  validates_length_of :pdf_link, :maximum=>255, :allow_nil => true


  attr_accessible :play_id, :location, :first_line, :body, :gender_id, :character, :style, :body_link, :pdf_link, :intercut

  def intercut_label
    self.intercut == 1 ? '- intercut' : ''
  end
end
