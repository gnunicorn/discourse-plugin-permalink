
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

module TopicPermalinkExtender

    def self.included(klass)
        klass.skip_before_filter :check_xhr, only: [:permalink]
    end

    def permalink
        field = TopicCustomField.where(:name=> 'permalink', :value=> "/" + params[:permalink]).first
        raise Discourse::NotFound unless field
        if SiteSetting.parmalink_redirect
            redirect_to field.topic.url
        else
            params[:id] = field.topic_id
            show
            store_preloaded("permalink_topic", field.topic_id.to_s)
            render 'show'
        end
    end
end

TopicsController.send(:include, TopicPermalinkExtender)

Discourse::Application.routes.append do
    get "*permalink" => "topics#permalink"
end
