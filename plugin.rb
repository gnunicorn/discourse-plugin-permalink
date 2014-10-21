# name: permalink
# about: permanlink support for Discourse
# version: 0.1
# authors: Benjamin Kampmann

register_asset "javascripts/permalink.js"

after_initialize do
    require_dependency File.expand_path('../integrate.rb', __FILE__)
end

after_after_initialize do
    Discourse::Application.routes.append do
        get "*permalink" => "topics#permalink"
    end
end