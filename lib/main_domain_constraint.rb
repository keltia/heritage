class MainDomainConstraint
  def initialize

  end

  def matches?(request)
    result = ['www.minideb.local', 'www.heritage.io'].include? request.server_name
    puts "Does it match the main website?: #{result} host: #{request.server_name}"
    result
  end
end
