# ======== A Handy Little Jasmine Reference ========
# http://pivotal.github.io/jasmine/

# Test methods:
#   describe "name", ()->

describe "Steady Slide", ->

  beforeEach ->
    container =
      """
      <ul id="slideshow">
        <li class="steady-item active">1</li>
        <li class="steady-item active">2</li>
        <li class="steady-item">3</li>
        <li class="steady-item">4</li>
      </ul>
      """
    $("body").append(container)

  afterEach ->
    $("body").empty()

  it "should be chainable", ->
    el = $("#slideshow")
    expect(el.steadyslide()).toEqual el
