AngulaRails.controller "BooksController", ($scope, Book) ->

  $scope.getBooks = () ->
    $scope.books = Book.query()

  $scope.edit = (book) ->
    $scope.book = Book.get({id: book.id})

  $scope.delete = (book) ->
    book.$delete()
    $scope.getBooks()

  $scope.save = () ->
    if $scope.book.id?
      Book.update($scope.book)
    else
      Book.save($scope.book)
    $scope.book = {}
    $scope.getBooks()


