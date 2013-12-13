class Role < ActiveRecord::Base
  has_many :users
  
  def permit?(controller, action)
    @controller = controller
    @action = action
    case title
      when 'admin'
        true
      when 'client'
        true
      when 'visiter'
       true
      else
        false
      end
      
  end
  
  private

    def request_to args={}
      not ( args[:controller].map(&:to_s) & [@controller] ).empty? and
      (not (args[:action].map(&:to_s)     & [@action]     ).empty? rescue true)
    end
end
