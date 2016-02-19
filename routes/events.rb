get '/api/events' do
  Event.all.to_json
end

get '/api/events/:id' do
  event = Event.get(params[:id])
  if event.nil?
    halt 404
  end
  event.to_json
end

post '/api/events' do
  body = JSON.parse request.body.read
  puts "body: #{body}"
  event = Event.create(
    tracker_id: body['tracker_id'],
    event: body['event'],
    reason: body['reason'],
    extended_reason: body['extended_reason']
  )

  status 201
  event.to_json 
end

put '/api/events/:id' do
  body = JSON.parse request.body.read
  event = Event.get(params[:id])
  if event.nil?
    halt(404)
  end
  halt 500 unless Event.update(
    tracker_id: body['tracker_id'],
    event: body['event'],
    reason: body['reason'],
    extended_reason: body['extended_reason']
  )
  event.to_json
end

delete '/api/events/:id' do
  event = Event.get(params[:id])
  if event.nil?
      halt 404
  end
  halt 500 unless event.destroy
end
