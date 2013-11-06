class ActiveSupport::HashWithIndifferentAccess
  def to_datetime(name)
    units = select{|k,v| k.match /#{name}\(..\)/}.map{|k,v| v.to_i}
    DateTime.new(*units)
  end
end