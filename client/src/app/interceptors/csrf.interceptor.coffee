# http://stackoverflow.com/questions/14734243/rails-csrf-protection-angular-js-protect-from-forgery-makes-me-to-log-out-on
angular.module 'myappAngular'
  .factory 'csrfInterceptor', ($q, $injector) ->
    responseError: (rejection) ->
      if rejection.status == 422 && rejection.data == 'Invalid authenticity token'
        deferred = $q.defer()

        successCallback = (resp) ->
          deferred.resolve(resp)
        errorCallback = (resp) ->
          deferred.reject(resp)

        $http = $http || $injector.get('$http')
        $http(rejection.config).then(successCallback, errorCallback)
        return deferred.promise

      $q.reject(rejection)
