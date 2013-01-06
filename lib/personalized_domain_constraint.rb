class PersonalizedDomainConstraint
  def initialize

  end

  def matches?(request)
    host_for_query = request.server_name
    host_for_query = "www.#{host_for_query}" if host_for_query !~ /^www\./
    
    User.count(:conditions => {:specific_url => host_for_query}) > 0 ||
      User.count(:conditions => {:internal_url => request.server_name}) > 0
  end
end
