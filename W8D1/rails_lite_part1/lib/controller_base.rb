require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'active_support/inflector'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    if !already_built_response?
      @res.status = 302
      @res.location = url
      @already_built_response = true
      nil
    else
      raise 'Double Render Error'
    end
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    if !already_built_response?
      @res.write(content)
      @res['Content-Type'] = content_type
      @already_built_response = true
    else
      raise 'Double Render Error'
    end
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    #index
    #../view/index.html.erb
    template_path = "views/" + self.class.to_s.underscore + "/" + template_name.to_s + ".html.erb"
    # p File.read(template_path)
    # path = File.read(template_path)
    template = ERB.new(File.read(template_path)).result(binding)

    # template = context_within_template.eval('')
    render_content(template, "text/html")
  end

  # method exposing a `Session` object
  def session

  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)

  end
end

