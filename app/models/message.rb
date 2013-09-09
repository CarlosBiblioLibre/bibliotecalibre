class Message

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :subject, :body

  validates :name, :email, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true

  def initialize(attributes = {})
    @name    = attributes['name']
    @email   = attributes['email']
    @body    = attributes['body']
    @subject = attributes['subject']
    #attributes.each do |name, value|
    # send("#{name}=", value)
  end

  def persisted?
    false
  end

end