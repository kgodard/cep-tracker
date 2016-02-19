class Event
  include DataMapper::Resource

    property :id,              Serial
    property :tracker_id,      Integer
    # property :story_title,     String
    # property :developer,       String
    # property :points,          Integer
    property :event,           String
    property :reason,          String
    property :extended_reason, String
    property :created_at,      DateTime
    property :updated_at,      DateTime
end 
puts 'processed'
