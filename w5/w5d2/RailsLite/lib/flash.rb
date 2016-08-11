require 'json'

class Flash
  attr_accessor :now

  def initialize(req)
    cookies = req.cookies['_rails_lite_app_flash']
    @now = (cookies.nil? || cookies == 'null') ? {} : JSON.parse(cookies)
    @store = {}
  end

  def store_flash(res)
    res.set_cookie('_rails_lite_app_flash', { path: '/', value: @store.to_json })
  end

  def [](data)
    @now[data] || @store[data]
  end

  def []=(data_key, data_value)
    @store[data_key] = data_value
  end
end
