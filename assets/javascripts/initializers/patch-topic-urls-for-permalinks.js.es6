
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
  }
};
