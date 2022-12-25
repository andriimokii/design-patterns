# Command
# - Turns a request into a stand-alone object that contains all information about the request.
# - This transformation lets you pass requests as a method arguments, delay or queue a request's execution,
#   and support undoable operations.

class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
  end
end

# ConcreteCommand
class CreateFile < Command
  def initialize(path, contents)
    super "Create file: #{path}"
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end

  def unexecute
    File.delete(@path)
  end
end

create_file = CreateFile.new('test', 'Some content.')
create_file.execute
create_file.unexecute
