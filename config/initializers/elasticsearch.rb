Elasticsearch::Model.client = Elasticsearch::Client.new host: ENV['ELASTICSEARCH_URL'] || 'localhost:9200'
