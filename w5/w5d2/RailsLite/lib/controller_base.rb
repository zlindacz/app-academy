require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require_relative './flash'
require 'active_support/inflector'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, params={})
    @req, @res = req, res
    @params = req.params.merge(params)
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "Cannot double redirect" if already_built_response?
    res.status = 302
    res['Location'] = url
    @already_built_response = true
    session.store_session(res)
    flash.store_flash(res)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "Cannot double render" if already_built_response?
    @res.write(content)
    @res['Content-Type'] = content_type
    @already_built_response = true
    session.store_session(res)
    flash.store_flash(res)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_name = self.class.name.underscore
    current_path = File.dirname(__FILE__)
    path = File.join(current_path, '..', 'views', "#{controller_name}", "#{template_name}.html.erb")
    contents = File.read(path)
    template = ERB.new(contents).result(binding)

    render_content(template, 'text/html')

  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(req)
  end

  def flash
    @flash ||= Flash.new(req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    self.send(name)
    # [:index, :show, :new, :edit].include?(name)
    render(name) unless already_built_response?
    # else
    #   redirect_to(req.fullpath)
    # end
  end
end
