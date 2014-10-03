Blogger.PostController = Ember.ObjectController.extend({
  isEditing: false,
  actions: {
    edit: function() {
    this.set('isEditing', true);
    },
    save: function() {
    this.set('isEditing', false);
    this.get('model').save();
    },
    delete: function() {
      if (confirm('Are you sure?')) {
      this.get('model').destroyRecord();
      this.transitionToRoute('posts');
      }
    }
  }

});
