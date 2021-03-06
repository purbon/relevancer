class Report < ApplicationRecord

  def self.build(docs, queryId, queryParams)
    dcg, idcg = search_metrics(docs)
    Report.new(queryId: queryId, queryParam: queryParams, dcg: dcg, idcg: idcg, ndcg: (dcg / idcg*1.0) )
  end

  def self.search_metrics(docs)
    dcg  = calculate_dcg(docs)
    idcg = calculate_dcg(docs.sort_by { |v| -v[:rel] })
    [ dcg, idcg ] 
  end

  def self.calculate_dcg(values) 
    dcg = 0 #values.first[:rel]
    values[0..-1].each_with_index do |rel, i|
      dcg += rel[:rel] / Math.log2(i+2)
    end
    dcg
  end

end
