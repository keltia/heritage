class PersonalizedDomainConstraint
  def initialize

  end

  def matches?(request)
    User.count(:conditions => {:specific_url => request.server_name}) > 0
  end
end
