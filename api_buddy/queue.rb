module ApiBuddy
  class Queue

    def initialize
      @q = []
      @front = 0
      @back  = 0
    end

    def add(job)
      @q[@front] = job
      @front += 1
    end

    def remove
      if empty?
        reset
        return nil 
      end
      job = @q[@back]
      @back += 1
    end  

    def empty?
      @front == @back
    end

    def reset
      @front = 0
      @back  = 0
    end
    
  end
end