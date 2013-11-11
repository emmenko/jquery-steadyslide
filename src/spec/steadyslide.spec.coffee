# ======== A Handy Little Jasmine Reference ========
# http://pivotal.github.io/jasmine/

# Test methods:
#   describe "name", ()->

describe "jQuery#steadyslide", ->

  beforeEach ->
    fixtures =
      """
      <div id="qunit-fixture">
        <span>lame test markup</span>
        <span>normal test markup</span>
        <span>awesome test markup</span>
      </div>
      """
    $("body").append(fixtures)
    @elems = $(fixtures).children()

  afterEach ->
    $("body").empty()

  it "should be chainable", ->
    expect(@elems.steadyslide()).toEqual @elems

  it "should be awesome", ->
    expect(@elems.steadyslide().text()).toBe "awesome0awesome1awesome2"

describe "jQuery.steadyslide", ->

  it "should be awesome", ->
    expect($.steadyslide()).toBe "awesome."
    expect($.steadyslide(punctuation: "!")).toBe "awesome!"

describe ":steadyslide selector", ->

  beforeEach ->
    fixtures =
      """
      <div id="qunit-fixture">
        <span>lame test markup</span>
        <span>normal test markup</span>
        <span>awesome test markup</span>
      </div>
      """
    $("body").append(fixtures)
    @elems = $(fixtures).children()

  afterEach ->
    $("body").empty()

  it "should be awesome", ->
    expect(@elems.filter(":steadyslide").get()).toEqual @elems.last().get()
