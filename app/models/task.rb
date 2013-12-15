class Task < ActiveRecord::Base
  belongs_to :account
  has_one :user, as: :owner
  
  validates_presence_of :title
  
  def as_json(options = {})
    {
      id: self.id,
      title: self.title,
      description: self.description || "",
      start: starts_at.rfc822,
      end: ends_at.rfc822,
      allDay: self.all_day,
      recurring: false,
      url: Rails.application.routes.url_helpers.edit_account_task_path(self.account_id, id)
    }
  end
end
