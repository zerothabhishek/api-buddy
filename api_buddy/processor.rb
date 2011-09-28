module ApiBuddy
  class Processor
  
    def self.init
      ApiBuddy.job_q = ApiBuddy::Queue.new
    end
  
    def self.run
      self.init
      loop do
        if job = ApiBuddy.job_q.remove
          ApiBuddy.process(job)
        else
          sleep 5
        end
      end
    end
    
  end
  
end