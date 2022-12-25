# Strategy
# - Lets you define a family of algorithms, put each of them into a separate class, and make their objects interchangeable.

# Strategy
class Formatter
  def output_report(title, text)
    raise 'Abstract method called'
  end
end

# ConcreteStrategy1
class HTMLFormatter < Formatter
  def output_report(title, text)
    puts('<html>')
    puts(' <head>')
    puts("  <title>#{title}</title>")
    puts(' </head>')
    puts(' <body>')
    text.each do |line|
      puts("  <p>#{line}</p>" )
    end
    puts(' </body>')
    puts('</html>')
  end
end

# ConcreteStrategy2
class PlainTextFormatter < Formatter
  def output_report(title, text)
    puts("***** #{title} *****")
    text.each do |line|
      puts(line)
    end
  end
end

# Context
class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @title = 'Monthly Report'
    @text = ['Things are going', 'really, really well.']
    @formatter = formatter
  end

  def output_report
    formatter.output_report(title, text)
  end
end

report = Report.new(HTMLFormatter.new)
report.output_report
report = Report.new(PlainTextFormatter.new)
report.output_report
