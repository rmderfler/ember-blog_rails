Blogger.Comment = DS.Model.extend({
  text: DS.attr(),
  post: DS.belongsTo('post', {async: true})
});
