# name: permalink
# about: permanlink support for Discourse
# version: 0.1
# authors: Benjamin Kampmann

register_asset "javascripts/permalink.js"

after_initialize do
    require_dependency File.expand_path('../integrate.rb', __FILE__)
end