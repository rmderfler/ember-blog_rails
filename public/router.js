Blogger.Router.map(function() {

 this.resource('posts', {path: '/'});
 this.resource('post', {path: 'posts/:post_id'}, function(){
  this.resource('new-comment');
 });
 this.resource('new-post');
 this.resource('recent-comments');
 this.resource('about');
 this.resource('contact', function() {

 this.resource('phone');
 this.resource('email');
 });
});
