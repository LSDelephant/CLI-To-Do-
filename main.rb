require_relative "tasks"

manager = TaskManager.new

command = ARGV[0]
argument = ARGV[1..].join(" ")

case command
when "list"
  manager.list
when "add"
  manager.add(argument)
when "done"
  manager.done(argument.to_i)
else
  puts "Використання:"
  puts " ruby main.rb list              # показати всі завдання"
  puts " ruby main.rb add \"Купити хліб\" # додати завдання"
  puts " ruby main.rb done 1            # відмітити як виконане"
end
