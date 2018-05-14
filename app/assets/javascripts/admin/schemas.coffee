# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

class SchemaManager
  updateMapping: ->
    return false
  add_row: ->
    size = $("#fields .content span").size()
    console.log("AddRow #{size}")
    $("#fields .meta").append(SchemaManager.build_meta_field(size))
    $("#fields .content").append(SchemaManager.build_content_field(size))
    # clear field values
    console.log("done");
  @build_meta_field: (size) ->
    """<span id='#{size}'> 
      <input name='name' type='hidden' value='title'>
      <input name="type" type="hidden" value="String">
      <input name="order" type="hidden" value="1">
      <input name="selected" type="hidden" value="1">
     </span>"""
   @build_content_field: (size) ->
    """<br/><span id='#{size}'> 
      <input name='name' value='title'>
      <input name="type" value="String">
      <input name="order" type="hidden" value="1">
      <input name="selected" type="hidden" value="1">
     </span>"""

window.schemaManager = new SchemaManager

