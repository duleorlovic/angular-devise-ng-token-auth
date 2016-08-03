angular.module 'myappAngular'
  .config ($logProvider, toastrConfig, $authProvider) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true
    # Set options third-party lib
    toastrConfig.allowHtml = true
    toastrConfig.timeOut = 3000
    toastrConfig.positionClass = 'toast-top-right'
    toastrConfig.preventDuplicates = true
    toastrConfig.progressBar = true
    $authProvider.configure
      apiUrl: 'http://localhost:3004'
