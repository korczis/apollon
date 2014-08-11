# encoding: UTF-8

# String class extensions
class String
  # rubocop:disable all
  def camelcase(*separators)
    case separators.first
      when Symbol, TrueClass, FalseClass, NilClass
        first_letter = separators.shift
    end

    separators = ['_', '\s'] if separators.empty?

    str = self.dup

    separators.each do |s|
      str = str.gsub(/(?:#{s}+)([a-z])/) { $1.upcase }
    end

    case first_letter
      when :upper, true
        str = str.gsub(/(\A|\s)([a-z])/) { $1 + $2.upcase }
      when :lower, false
        str = str.gsub(/(\A|\s)([A-Z])/) { $1 + $2.downcase }
    end

    str
  end

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
  # rubocop:enable all
end
