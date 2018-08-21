$(document).ready(function() {
  $('.attachinary-input').attachinary();
});

$.attachinary.config.template = '\
  <ul>\
    <% for(var i=0; i<files.length; i++){ %>\
      <li>\
        <% if(files[i].resource_type == "raw") { %>\
          <div class="raw-file"></div>\
        <% } else { %>\
          <img\
            src="<%= $.cloudinary.url(files[i].public_id, { "version": files[i].version, "format": "jpg", "crop": "fill", "width": 125, "height": 125 }) %>"\
            alt="" width="125" height="125" />\
        <% } %>\
        <a href="#" data-remove="<%= files[i].public_id %>" class="fas fa-trash-alt"></a>\
      </li>\
    <% } %>\
  </ul>\
';
