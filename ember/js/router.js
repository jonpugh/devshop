DevShop.Router.map(function() {
    this.resource('todos', { path: '/' });
});


// ... additional lines truncated for brevity ...
DevShop.ProjectsRoute = Ember.Route.extend({
    model: function() {
        return this.store.find('project');
    }
});