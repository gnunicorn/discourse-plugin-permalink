
# Integrate our plugin with Discourse

# make sure we have the permalink in our topic
module PermalinkTopicViewExtender
    def self.included(klass)
        klass.attributes :permalink
    end
    def permalink
        object.topic.custom_fields["permalink"] if object.topic.custom_fields && object.topic.custom_fields.has_key?("permalink")
    end
end

module PermalinkExtender
    def self.included(klass)
        klass.attributes :permalink
    end
    def permalink
        object.custom_fields["permalink"] if object.custom_fields && object.custom_fields.has_key?("permalink")
    end
end

TopicViewSerializer.send(:include, PermalinkTopicViewExtender)
BasicTopicSerializer.send(:include, PermalinkExtender)

# And mount the engine
# Discourse::Application.routes.append do
#     mount Tagger::Engine, at: ':permalink'
# end
