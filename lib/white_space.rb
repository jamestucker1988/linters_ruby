module White_space
  def trail_space(func)
    func.each_with_index do |x, i|
      if i < (func.size - 1)
        puts "trailing white_space at  line #{i + 1} " if x.match?(/\s+\n/)
      else
        puts "trailing white_space at  line #{i + 1} " if x.match?(/\s+$/)
      end
    end
  end
end
# rubocop:enable Metrics/ModuleLength, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/For
