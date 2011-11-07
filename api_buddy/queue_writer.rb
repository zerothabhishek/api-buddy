module ApiBuddy
  
  class QueueWriter
    
    def initialize
      pipe_path = ApiBuddy::QPipePath
      @pipe = Fifo.new("#{pipe_path}", :w, :nowait)
    end
    
    def add(job_str)
      p "Adding #{job_str}"
      @pipe.puts(job_str)
    end
    
  end
end