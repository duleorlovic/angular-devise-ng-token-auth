'use strict';

angular.module('myappAngular')
  .factory('Article', function ($resource) {
    return $resource('http://localhost:3004/articles/:articleId', {
      articleId: '@id'
    }, {
      update: {
        method: 'PUT'
      }
    });
  });
