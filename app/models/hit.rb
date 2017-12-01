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
    hit['_source'][name]
  end

  def highlight_field(name)
    hit['highlight'][name]
  end

end
