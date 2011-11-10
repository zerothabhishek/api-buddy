module ApiBuddy
  
  class QueueReader
    
    def initialize
      pipe_path = ApiBuddy::QPipePath
      @pipe = Fifo.new("#{pipe_path}", :r)
    end
    
    def pop
      @pipe.readline
    end
        
  end
end
    
