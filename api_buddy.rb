require File.expand_path('../api_buddy/job', __FILE__)
require File.expand_path('../api_buddy/queue_reader', __FILE__)
require File.expand_path('../api_buddy/queue_writer', __FILE__)
require File.expand_path('../api_buddy/listener', __FILE__)
require File.expand_path('../../ruby-fifo/lib/fifo.rb', __FILE__)

module ApiBuddy

  QPipePath = "./api_buddy_q"

  def self.setup
    @qw = ApiBuddy::QueueWriter.new
  end
  
  def self.qr
    @qr ||= ApiBuddy::QueueReader.new
  end
  
  def self.qw
    @qw 
  end
  
  def self.go(model_object, method_name)
    job = Job.from_obj(model_object, method_name)
    p "Job: #{job}"
    self.qw.add(job.to_s)
  end

end

#module ApiBuddy
#  @@job_q = nil 
#  
#  def self.job_q =(q)
#    @@job_q = q
#  end
#  
#  def self.job_q
#    @@job_q
#  end
#      
#  def self.go(obj, request_method, callback_method)
#    job = ApiBuddy::Job.new(obj, request_method, callback_method)
#    ApiBuddy.job_q(job)
#  end
#  
#  def self.process(job)
#    object          = job.object
#    request_method  = job.request_method
#    callback_method = job.callback_method
#    response = object.send(request_method)
#    object.send(callback_method, response)
#  end
#
#end

            
