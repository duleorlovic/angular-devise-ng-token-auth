angular.module 'myappAngular'
  .factory 'ArticleResource', (railsResourceFactory) ->
    railsResourceFactory(
      url: 'http://localhost:3004/articles'
      name: 'article'
    )

