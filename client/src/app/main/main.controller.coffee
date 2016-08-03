angular.module 'myappAngular'
  .controller 'MainController', ($timeout, webDevTec, toastr, Article, $auth) ->
    'ngInject'
    vm = this
    activate = ->
      getWebDevTec()
      $timeout (->
        vm.classAnimation = 'rubberBand'
        return
      ), 4000
      return

    credentials =
      email: 'asd@asd.asd'
      password: 'asdasd'

    vm.register = ->
      $auth.submitRegistration(credentials).then(
        (resp) ->
          console.log resp
        (error) ->
          console.log error
      )

    vm.login = ->
      $auth.submitLogin(credentials).then(
        (resp) ->
          console.log resp
        (error) ->
          console.log error
      )
    vm.logout = ->
      $auth.signOut().then(
        (resp) ->
          console.log resp
        (error) ->
          console.log error
      )
    vm.validateUser = ->
      $auth.validateUser().then(
        (oldUser) ->
          console.log oldUser
        (error) ->
          console.log error
      )
    vm.authUser = ->
      console.log $auth.user


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
