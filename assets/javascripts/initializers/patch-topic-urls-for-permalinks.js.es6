
export default {
  name: "patch-topic-urls-for-permalinks",

  initialize: function(container, application) {
    if (application.SiteSettings.parmalink_redirect) {
      // if we run within the redirect setting, don't overwrite the url-builder.
      return;
    }

    var Topic = container.lookupFactory('model:topic');
    Topic.reopen({
      url: function(){
        if (this.get("permalink")) {
          return this.get("permalink");
        }
        return this._super();
      }.property('id', 'slug', 'permalink'),
    });

    // we have a weird reference issue here. this is just a workaround
    container.lookupFactory("view:dropdown-button").reopen({
      willDestroyElement: function(){
        this.$('ul li') && this._super();
      }
    });

    Discourse.PermalinkRoute = Discourse.TopicRoute.extend({
      controllerName: "topic",
      model: function(params, transition) {
        params['id'] = PreloadStore.data.permalink_topic;
        params.slug = "/"
        params.t = "t"
        var model = this.setupParams(Discourse.Topic.create(_.omit(params, 'username_filters', 'filter')), transition.queryParams);
        console.log(model);
        this.container.lookup('route:topic').currentModel = model;
        return model;
      },

      setupController: function(controller, model){
        this._super(controller, model);
        var params = this.container.lookup('route:topic-from-params');
        console.log(params);
        params.setupController(controller, model);
      }
    });

    Discourse.PermalinkView = Discourse.TopicView; //.extend();

    application.Router.map(function() {
      this.route('permalink', { path: '/super/permalink/test' });
    });
  }
};
