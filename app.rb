require 'sinatra'
require 'sinatra/activerecord'
require 'redcarpet'

set :database_file, 'config/database.yml'
set :views, './views'

require './models/problem'

get '/' do
  id = (Time.now.yday % Problem.count) + 1
  @problem = to_html(Problem.find(id).text)
  erb :index
end

private
  def to_html(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(text)
  end