
# The model class
class ApiBuddyDemo < SomeOrm
  
  def foo_sync
    response = self.api_request
    self.api_callback(response)
  end
  
  def foo_async
    ApiBuddy.go(self, :api_request)
  end
  
  def api_request
    response = "23"
  end
end

# The ApiBuddy go method
def ApiBuddy.go(obj, method)
  job = ApiBuddy::Job.new(obj.class, obj.id, method)
  ApiBuddy::Q.add(job)
end


# The ApiBuddy queue handler
class ApiBuddy::Q

  def self.add(job)
  end
  
  def self.pop
  end
  
  def self.process
    job = self.pop
    mClass   = job.mClass
    mId      = job.mId
    mMethod  = job.mMethod
    
    mObj = mClass.constantize.find(mId)
    mObj.send(mMethod.to_sym)    
  end
end





