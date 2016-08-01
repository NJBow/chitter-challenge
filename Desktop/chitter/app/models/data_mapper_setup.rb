require 'data_mapper'
 require 'dm-postgres-adapter'

 require_relative 'models/user'

 DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chit_chat")
 DataMapper.finalize
 DataMapper.auto_upgrade!
