# == Schema Information
#
# Table name: media
#
#  id                      :integer          not null, primary key
#  investment_id           :integer
#  path                    :string
#  created_at              :datetime
#  updated_at              :datetime
#  media_item_file_name    :string
#  media_item_content_type :string
#  media_item_file_size    :integer
#  media_item_updated_at   :datetime
#  type                    :string
#

class Medium < ActiveRecord::Base

  belongs_to :investment

  has_attached_file :media_item, :styles => { :pdf_thumbnail => ["", :jpg], :thumb => "100x100#" }
  do_not_validate_attachment_file_type :media_item


  # This method is deprecated, use get_all_investment_media
  # def get_investment_media(id)
  #   sql = "SELECT * FROM media WHERE investment_id='"+id+"'"
  #   @list = ActiveRecord::Base.connection.execute(sql)
  # end

  def get_all_investment_media(id)
    @inv = Medium.where(:investment_id => id)
  end

  def get_all_investment_media_group()
    @inv = Medium.select("*").group("investment_id")
  end

  def get_all()
   @inv =  Medium.select('investment_id, id')
  end

  def get_document_count_by_id(id)
    @inv = Medium.where(:investment_id => id, :media_item_content_type => 'application/pdf').count
  end


end
