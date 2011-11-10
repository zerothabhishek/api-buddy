class Notification

  def self.find(id)
    self.new(id)
  end

  def initialize(id)
    @id=id
  end

  def id
    @id
  end
  
  def call_buddy
    ApiBuddy.go(self, :slow_method)
  end    
  
  def slow_method
    p "doing the slow action"
  end
  
end