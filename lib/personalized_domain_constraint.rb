class PersonalizedDomainConstraint
  def initialize

  end

  def matches?(request)
    host_for_query = request.server_name
    host_for_query = "www.#{host_for_query}" if host_for_query !~ /^www\./

    host_for_query_without_www = request.server_name
    host_for_query_without_www.gsub!(/^www\./, '')
    
    User.count(:conditions => ['specific_url = ? OR specific_url = ?  OR internal_url = ? OR internal_url = ?',
              host_for_query, host_for_query_without_www, 
              host_for_query, host_for_query_without_www]) > 0
  end
end
