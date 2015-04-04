//= require rails_helper
//= require games_controller
describe('init', function() {
  it("sets the currentPage", function() {
    expect($scope.currentPage).toBe(1);
  });
});