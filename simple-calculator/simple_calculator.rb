class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError if !first_operand.is_a?(Integer) || !second_operand.is_a?(Integer)

    return 'Division by zero is not allowed.' if second_operand.zero?

    raise UnsupportedOperation if ALLOWED_OPERATIONS.none?(operation)

    "#{first_operand} #{operation} #{second_operand} = #{first_operand.send(operation, second_operand)}"
  end

  class UnsupportedOperation < StandardError
  end
end
