module ApiBuddy

  class Job
    attr_reader :model_klass, :model_id, :method_name
    
    def initialize(model_klass, model_id, method_name)
      @model_klass = model_klass
      @model_id    = model_id
      @method_name = method_name
    end
    
    def to_s
      "#{@model_klass},#{@model_id},#{@method_name}"
    end
    
    def self.from_obj(model_obj, method_name)
      model_klass = model_obj.class.to_s
      model_id    = model_obj.id.to_s
      method_name = method_name.to_s
      job = self.new(model_klass, model_id, method_name)
    end
    
    def self.from_str(job_str)
      fields = job_str.split(',')
      model_klass = fields[0]
      model_id    = fields[1]
      method_name = fields[2]
      job = self.new(model_klass, model_id, method_name)
    end
    
    def self.process(job_str)
      job_str.chomp!
      job = self.from_str(job_str)
      job.process
    end

    def process
      klass  = constantize(@model_klass)
      id     = @model_id.to_i
      method = @method_name.to_s
      obj    = klass.find(id)
      obj.send(method)
    end
    
    # constantize is a part of ActiveSupport lib.
    def constantize(str)
      Object.const_get(str)
    end
    
  end

end

#module ApiBuddy
#  class Job
#
#    def initialize(object, request_method = :api_request, callback_method = :api_callback)
#      @object   = object
#      @method   = request_method
#      @callback = callback_method
#    end
#    
#  end
#end