class Post < ActiveRecord::Base
    
  def foo
    ApiBuddy.go(self, :slow_action)
  end
  
  def slow_action
    sleep 5
  end
  
end
