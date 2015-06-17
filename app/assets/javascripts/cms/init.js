$(document).ready(function() {

  $(document).foundation();

  $('.tabs').tabs();

  CmsCkEditor.init('.form-left');

  CmsAssets.bind_draggables('.sidebar', '.form-left');
  CmsAssets.bind_droppables('.sidebar', '.form-left');
  CmsAssets.bind_single_droppables('.form-left');
  CmsAssets.bind_remove();
  CmsAssets.bind_search();

  CmsComponents.bind_draggables('.sidebar', '.form-left');
  CmsComponents.bind_droppables('.sidebar', '.form-left');
  CmsComponents.bind_remove();

});
