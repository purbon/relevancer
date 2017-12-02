class Hit

  attr_reader :hit

  def initialize(hit)
    @hit = hit
  end

  def id
    hit['_id']
  end

  def contains_highlight?
     hit['highlight']
  end

  def field(name)
    if contains_highlight? 
      highlight_field(name) || source_field(name)
    else 
      source_field(name)
    end
  end

  def source_field(name)
    hit['_source'][name]
  end

  def highlight_field(name)
    hit['highlight'][name]
  end

end
