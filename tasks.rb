require "json"

class TaskManager
  FILE = "tasks.json"

  def initialize
    File.write(FILE, "[]") unless File.exist?(FILE)
    @tasks = JSON.parse(File.read(FILE))
  end

  def list
    if @tasks.empty?
      puts "✅ Список завдань порожній."
    else
      puts "📋 Список завдань:"
      @tasks.each_with_index do |task, i|
        status = task["done"] ? "✔️" : "❌"
        puts "#{i + 1}. [#{status}] #{task['title']}"
      end
    end
  end

  def add(title)
    @tasks << { "title" => title, "done" => false }
    save
    puts "➕ Завдання додано: #{title}"
  end

  def done(index)
    task = @tasks[index - 1]
    if task
      task["done"] = true
      save
      puts "🎉 Завдання виконано: #{task['title']}"
    else
      puts "⚠️ Немає такого завдання."
    end
  end

  private

  def save
    File.write(FILE, JSON.pretty_generate(@tasks))
  end
end
