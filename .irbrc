# encoding: utf-8

gems = %w(rubygems hirb pry)

gems.each do |gem|
  begin
    require gem
  rescue
    warn "Couldn't load #{gem} #{err}"
  end
end

