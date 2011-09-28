module ApiBuddy
  class Job

    def initialize(object, request_method = :api_request, callback_method = :api_callback)
      @object   = object
      @method   = request_method
      @callback = callback_method
    end
    
  end
end