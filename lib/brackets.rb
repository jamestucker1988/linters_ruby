# rubocop:disable  Metrics/MethodLength
module Brackets
  def bracket(func)
    $brack_pair = { '{' => '}', '[' => ']', '(' => ')' }
    arr = []
    func.each_with_index do |line, _i|
      line_r = line.split(' ')
      next if line_r.empty?
      line_r.each_with_index do |char, _k|
        char.each_char do |s, _j|
          arr.push(s) if $brack_pair.keys.include?(s) || $brack_pair.values.include?(s)
        end
      end
      puts 'missing bracket' if arr.size.odd? && !line_r.empty?.red
      arr.clear
    end
end
end
# rubocop:enable Metrics/ModuleLength, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/For
