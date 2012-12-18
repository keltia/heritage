class PersonalizedDomainConstraint
  def initialize

  end

  def matches?(request)
    puts "Looking for #{request.server_name}"
    User.count(:conditions => {:specific_url => request.server_name}) > 0
  end
end
