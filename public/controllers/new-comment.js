Blogger.NewCommentController = Ember.ObjectController.extend({
  needs: ['post'],
  actions: {
          save: function() {
            var controller = this;
          var comment = this.store.createRecord('comment', {
          text: this.get('text')
            });

          var post = this.get('controllers.post.model');
          post.get('comments').pushObject(comment);
          comment.save().then(controller.set('text', ''));
          this.transitionToRoute('post', post.id);
          }
  }

});
