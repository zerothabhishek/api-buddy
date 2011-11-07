class ApiBuddyDemo
  
  def foo_sync
    response = self.api_request
    self.api_callback(response)
  end
  
  def foo_async
    ApiBuddy.go(self, :api_request, :api_callback)
  end
  
  def api_request
    response = "23"
  end
  
  def api_callback(response)
  end
  
end