class Corrector
  def correct_name(name)
    name.strip.capitalize[0...10]
  end
end
