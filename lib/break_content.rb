class BreakContent
  def initialize(content, limit)
    @content = content
    @limit = limit
  end

  def call
    break_content
  end

  private

  attr_reader :content, :limit

  def break_content
    words = content.split

    lines = []
    line = ""
  
    words.each do |word|
      if line.size + word.size + 1 <= limit  # Add 1 for the space after each word
        line += "#{word} "
      else
        lines << line.strip
        line = "#{word} "
      end
    end
  
    lines << line.strip unless line.empty?
  
    lines.join("\n")
  end
end