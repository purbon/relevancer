# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

json1 = ' {  "query": { "match": { "Title.english": "<%= query_param %>"  }  } }'
json2 = ' {  "query": { "match": { "Body.english": "<%= query_param %>"  }  } }'
json3 = ' { "query": { "multi_match": { "query": "<%= query_param %>", "fields": ["Title.english", "Body.english"] } } }'

schema = Schema.create(name: 'posts')
Field.create(name: 'Body', selected: true, order: 2, schema: schema)
Field.create(name: 'Title', selected: true, order: 1, schema: schema)
Field.create(name: 'LastActivityDate', selected: true, order: 3, schema: schema)


Query.create(name: 'MatchTitle', index: 'posts', json: json1, schemas: [schema])
Query.create(name: 'MatchBody', index: 'posts', json: json2,  schemas: [schema])
Query.create(name: 'MultiMatch', index: 'posts', json: json3,  schemas: [schema])

