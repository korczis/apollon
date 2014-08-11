# encoding: UTF-8

class String
  def camel_case
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split('_').map { |e| e.capitalize }.join
  end

  def modulize
    #gsub('__','/').  # why was this ever here?
    gsub(/__(.?)/) { "::#{$1.upcase}" }.
      gsub(/\/(.?)/) { "::#{$1.upcase}" }.
      gsub(/(?:_+|-+)([a-z])/) { $1.upcase }.
      gsub(/(\A|\s)([a-z])/) { $1 + $2.upcase }
  end
end
