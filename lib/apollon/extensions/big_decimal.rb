# encoding: utf-8

require 'bigdecimal'

# Apollon BigDecimal Extensions
class BigDecimal
  def pretty_print(p)
    p.text to_s
  end
end
