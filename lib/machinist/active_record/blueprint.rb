module Machinist::ActiveRecord
  class Blueprint < Machinist::Blueprint

    # Make and save an object.
    def make!(attributes = {})
      object = make(attributes)
      object.save!
      object.reload
    end
    
    def force_make!(attributes = {})
      object = make(attributes)

      if ActiveRecord::VERSION::MAJOR > 2
        object.save(validate: false)
      else
        object.save(false)
      end

      object.reload
    end

    def lathe_class #:nodoc:
      Machinist::ActiveRecord::Lathe
    end

  end
end
