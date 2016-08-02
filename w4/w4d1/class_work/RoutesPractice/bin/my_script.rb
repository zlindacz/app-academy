require 'addressable/uri'
require 'rest-client'

# bin/my_script.rb
def index_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users/1.json',
    ).to_s


    puts RestClient.get(url)
end




def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  begin
    puts RestClient.post(
      url,
      { user: { name: name, email: email}}
    )
  rescue
    puts "can't do that"
  end
end

create_user("Sundae", "gizmo@gizmo.gizmo")
