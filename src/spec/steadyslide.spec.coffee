# ======== A Handy Little Jasmine Reference ========
# http://pivotal.github.io/jasmine/

# Test methods:
#   describe "name", ()->

describe "Steady Slide", ->

  beforeEach ->
    container =
      """
      <ul id="slideshow">
        <li data-toggle="steady-item" class="active">1</li>
        <li data-toggle="steady-item" class="active">2</li>
        <li data-toggle="steady-item">3</li>
        <li data-toggle="steady-item">4</li>
      </ul>
      """
    $("body").append(container)

  afterEach ->
    $("#slideshow").remove()

  it "should be chainable", ->
    el = $("#slideshow")
    expect(el.steadyslide()).toEqual el

  it "should put active elements at the head of the children list", ->
    el = $("#slideshow")
    el.steadyslide()
    expect($(el.children().get(0)).hasClass("active")).toBe true
    expect($(el.children().get(1)).hasClass("active")).toBe true
    expect($(el.children().get(2)).hasClass("active")).toBe false
    expect($(el.children().get(3)).hasClass("active")).toBe false

  it "should cycle elements", ->
    DURATION = 100
    INTERVAL = 1000
    el = $("#slideshow")
    el.steadyslide(duration: DURATION, interval: INTERVAL)

    runs ->
      expect($(el.children().get(0)).hasClass("active")).toBe true
      expect($(el.children().get(0)).text()).toBe "1"

    waitsFor ->
      $(el.children().get(0)).text() is "3"
    , "Item 3 should be visible"

    runs ->
      expect($(el.children().get(3)).hasClass("active")).toBe false
      expect($(el.children().get(3)).text()).toBe "1"

    waitsFor ->
      $(el.children().get(1)).text() is "4"
    , "Item 4 should be visible"

    runs ->
      expect($(el.children().get(2)).hasClass("active")).toBe false
      expect($(el.children().get(2)).text()).toBe "1"
      expect($(el.children().get(3)).hasClass("active")).toBe false
      expect($(el.children().get(3)).text()).toBe "2"