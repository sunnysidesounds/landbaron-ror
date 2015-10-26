# == Schema Information
#
# Table name: investments
#
#  id                   :integer          not null, primary key
#  name                 :string
#  logo_link            :string
#  investment_type      :string
#  raise_amount         :decimal(, )
#  minimum_raise_amount :decimal(, )
#  investment_duration  :string
#  video_link           :string
#  status               :string
#  risk_rating          :string
#  key_information      :text
#  photos_link_id       :integer
#  principle_bio_id     :integer
#  investment_minimum   :string
#  fee_structure        :text
#  note                 :text
#  spots_available      :integer
#  qa_id                :integer
#  legal_documents_id   :integer
#  created_at           :datetime
#  updated_at           :datetime
#  qa                   :text
#  logo_file_name       :string
#  logo_content_type    :string
#  logo_file_size       :integer
#  logo_updated_at      :datetime
#  spots_have           :string
#  vote_enabled         :integer          default(0)
#  address              :string
#  regulation           :string
#

class Investment < ActiveRecord::Base

  has_and_belongs_to_many :principle_investors
  has_and_belongs_to_many :investment_questions
  has_many :quotes
  has_many :investment_images
  has_many :investment_documents
  has_many :votes

  acts_as_taggable

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ':placeholder'
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  REG_C_REGULATION = "Reg C."
  REG_B_REGULATION = "Reg B."
  REGULATIONS = [REG_B_REGULATION, REG_C_REGULATION]

  COMING_SOON = "coming_soon"
  PAST = "past"
  RECENTLY_FUNDED = "funded"
  TEST_THE_WATERS = "test_the_waters"
  ALL_TYPES = [COMING_SOON, PAST, RECENTLY_FUNDED, TEST_THE_WATERS]

  scope :reg_c_investments, -> { where(regulation: REG_C_REGULATION) }
  scope :reg_b_investments, -> { where(regulation: REG_B_REGULATION) }
  scope :reg_free_investments, -> { where(regulation: nil) }
  

  accepts_nested_attributes_for :investment_images, allow_destroy: :true
  accepts_nested_attributes_for :investment_documents, allow_destroy: :true


  # Deprecated method, use get_lp_investments instead
  # def get_landing_page_investments(status)
  #   limit = status == 'past' ? '8': '3'
  #   sql = "SELECT * FROM investments WHERE status='"+status+"' ORDER BY id LIMIT "+limit+" "
  #   @list = ActiveRecord::Base.connection.execute(sql)
  # end

  def self.get_lp_investments(stat_key)
    limit = stat_key == 'past' ? '8': '3'
    @inv = Investment.where(:status => stat_key).limit(limit)
  end

  def get_progress_stats
    self.quotes.sum(:total_amount)
  end

  def investment_percent_progress
    if self.get_progress_stats >= (self.raise_amount.to_i || 0)
      "100%"
    else
      (((self.get_progress_stats/self.raise_amount.to_i)*100).floor).to_s + "%"
    end
  end
  # Deprecated method, use get_a_investment_detail instead
  # def get_investment_details(id)
  #   sql = "SELECT * FROM investments WHERE id='"+id+"' ORDER BY id"
  #   @list = ActiveRecord::Base.connection.execute(sql)
  # end

  def get_a_investment_detail(id)
    @inv = Investment.find(id)
  end

  def get_all()
    @inv = Investment.select('name, id')
  end


  def can_be_invested_in?
    self.status != COMING_SOON
  end

end
