Blogger.NewPostController = Ember.Controller.extend({
actions: {
          save: function() {
            var controller = this;
            var newPost = this.store.createRecord('post', {
              title: this.get('title'),
              body: this.get('body')
              });
            newPost.save().then(function() {
              controller.set('title', '');
              controller.set('body', '');
              controller.transitionToRoute('posts');
            });


            }
          }
});
