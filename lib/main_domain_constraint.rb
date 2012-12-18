class MainDomainConstraint
  def initialize

  end

  def matches?(request)
    ['www.minideb.local', 'www.heritage.io', 'heritage.io'].include? request.server_name
  end
end
