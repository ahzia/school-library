class Corrector
  def correct_name(name)
    result = name.capitalize
    result[0, 10]
  end
end
