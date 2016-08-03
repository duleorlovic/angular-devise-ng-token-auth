angular.module 'myappAngular'
  .controller 'MainController', ($timeout, webDevTec, toastr, Article, Auth) ->
    'ngInject'
    vm = this
    credentials =
      email: 'asd@asd.asd'
      password: 'asdasd'

    vm.login = ->
      Auth.login(credentials).then(
        (user) ->
          console.log user
        (error) ->
          console.log error
      )
    vm.logout = ->
      Auth.logout().then(
        (oldUser) ->
          console.log oldUser
        (error) ->
          console.log error
      )
    vm.currentUser = ->
      Auth.currentUser().then(
        (oldUser) ->
          console.log oldUser
        (error) ->
          console.log error
      )
    vm.isAuthenticated = ->
      console.log Auth.isAuthenticated()

    activate = ->
      getWebDevTec()
      $timeout (->
        vm.classAnimation = 'rubberBand'
        return
      ), 4000
      return

    showToastr = ->
      Article.query (res) ->
        vm.articles = res
      toastr.info 'Fork <a href="https://github.com/Swiip/generator-gulp-angular" target="_blank"><b>generator-gulp-angular</b></a>'
      vm.classAnimation = ''
      return

    getWebDevTec = ->
      vm.awesomeThings = webDevTec.getTec()
      angular.forEach vm.awesomeThings, (awesomeThing) ->
        awesomeThing.rank = Math.random()
        return
      return

    vm.awesomeThings = []
    vm.classAnimation = ''
    vm.creationDate = 1470235512042
    vm.showToastr = showToastr
    activate()
    return
