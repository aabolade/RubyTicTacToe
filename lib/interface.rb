class Interface

  def validate(input)
    input.to_i.to_s != input || input.to_i < 0
  end

end
