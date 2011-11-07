module ApiBuddy
  
  class Listener
    
    def self.run
      p "ApiBuddy Listener listening..."
      loop do
        q_reader = ApiBuddy.qr
        job_str = q_reader.pop  # blocks here
        begin
          p "#{job_str}"
          ApiBuddy::Job.process(job_str)
        rescue => e
          p "Exception: #{e.message}\n" #"#{e.backtrace}"
        end  
      end
    end
    
    
  end
end