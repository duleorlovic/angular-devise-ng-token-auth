angular.module 'myappAngular'
  .config ($logProvider, toastrConfig, AuthProvider, $httpProvider) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true
    # Set options third-party lib
    toastrConfig.allowHtml = true
    toastrConfig.timeOut = 3000
    toastrConfig.positionClass = 'toast-top-right'
    toastrConfig.preventDuplicates = true
    toastrConfig.progressBar = true
    AuthProvider.loginPath 'http://localhost:3004/users/sign_in.json'
    AuthProvider.logoutPath 'http://localhost:3004/users/sign_out.json'
    $httpProvider.defaults.withCredentials = true
