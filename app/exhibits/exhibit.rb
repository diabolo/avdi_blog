require 'delegate'

class Exhibit < SimpleDelegator
  def initialize(model, context)
    @context = context
    super(model)
  end

  def to_model
    __get_obj__
  end

  def to_class
    __get_obj__.class
  end
end
