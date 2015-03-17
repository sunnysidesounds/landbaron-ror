class Quote < ActiveRecord::Base

  validates_presence_of :total_amount, :on => :create







end
