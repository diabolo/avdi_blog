require 'delegate'

class Exhibit < SimpleDelegator

  def self.exhibits
    [
      TextPostExhibit,
      PicturePostExhibit,
    ]
  end

  def self.exhibit(object, context)
    exhibits.inject(object) do |object, exhibit|
      exhibit.exhibit_if_match(object, context)
    end
  end

  def self.exhibit_if_match(object, context)
    if match?(object)
      new(object, context)
    else
      object
    end
  end

  def self.match?(object)
    false
  end

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
