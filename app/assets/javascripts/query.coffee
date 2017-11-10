# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


setup = () ->
   element = document.getElementById("editor")
   options = {
     theme: 'bootstrap2'
   }
   editor = new JSONEditor(element, options)
   editor.setValue({name: "John Smith"})

window.onload = setup
