require "csv"

class Judgement < ApplicationRecord
  has_and_belongs_to_many :judgementLists

  def self.to_csv(judgements)
    headers = %w{ docID queryId queryParam rel }
    CSV.generate(headers: true, :col_sep => ",") do |csv|
      csv << headers

      judgements.each do |judgement|
        csv << headers.map { |attr| judgement.send(attr) }
      end
    end
  end
end
