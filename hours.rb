total_hours = 0
total_wage = 0
rate = 20
loop do
  puts "Total number of hours worked: #{total_hours}"
  puts "Enter the number of hours worked on the current day (or 'save' to finish): "
  hours = gets.chomp
  if hours == 'save' || hours == 'done'
    if hours == 'save'
      File.open('hours.txt', 'a') do |file|
        file.puts "Total number of hours worked: #{total_hours}"
        file.puts "Total wage: #{total_wage} PLN"
      end
      puts "Data saved to 'hours.txt'"
    end
    if hours == 'done'
      if File.exists?('hours.txt')
        File.delete('hours.txt')
      end
      puts "Data deleted"
    end
    break
  end
  total_hours += hours.to_i
  total_wage += rate * hours.to_i
  current_wage = rate * hours.to_i
  puts "Current wage: #{current_wage} "
end
puts "Total wage: #{total_wage} PLN"
