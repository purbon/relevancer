# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

json1 = ' {  "query": { "match": { "title": "<%= query_param %>"  }  } }'
json2 = ' {  "query": { "match": { "text": "<%= query_param %>"  }  } }'
json3 = ' { "query": { "multi_match": { "query": "<%= query_param %>", "fields": ["title", "text"] } } }'

schema = Schema.create(name: 'posts')
Field.create(name: 'text', selected: true, order: 2, schema: schema)
Field.create(name: 'title', selected: true, order: 1, schema: schema)
Field.create(name: 'timestamp', selected: true, order: 3, schema: schema)


Query.create(name: 'MatchTitle', index: 'wikipedia', json: json1, schemas: [schema])
Query.create(name: 'MatchBody', index: 'wikipedia', json: json2,  schemas: [schema])
Query.create(name: 'MultiMatch', index: 'wikipedia', json: json3,  schemas: [schema])

