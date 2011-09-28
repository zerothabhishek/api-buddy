require 'api_buddy/job'
require 'api_buddy/queue'
require 'api_buddy/processor'

module ApiBuddy
  @@job_q = nil 
  
  def self.job_q =(q)
    @@job_q = q
  end
  
  def self.job_q
    @@job_q
  end
      
  def self.go(obj, request_method, callback_method)
    job = ApiBuddy::Job.new(obj, request_method, callback_method)
    ApiBuddy.job_q(job)
  end
  
  def self.process(job)
    object          = job.object
    request_method  = job.request_method
    callback_method = job.callback_method
    response = object.send(request_method)
    object.send(callback_method, response)
  end

end


