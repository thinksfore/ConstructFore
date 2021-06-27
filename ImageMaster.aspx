<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/admin.Master" CodeBehind="ImageMaster.aspx.cs" Inherits="ConstructFore.admin.ImageMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
          <!-- Specific Page Vendor CSS -->
    <link rel="stylesheet" href="assets/vendor/select2/select2.css" />
    <link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
    <link href="assets/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />
    <link rel="stylesheet" href="assets/stylesheets/skins/default.css" />
    <style>
        .modal-body>img{
            width:100%;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="panel">
        <header class="panel-heading">
            <div class="panel-actions">
                <a href="#" class="fa fa-caret-down"></a>
                <a href="#" class="fa fa-times"></a>
            </div>

            <h2 class="panel-title">Image Master</h2>
        </header>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6">
                    <div class="mb-md">
                        <a class="modal-with-form btn btn-primary" href="javascript:void(0);" id="btnAdd">Add <i class="fa fa-plus"></i></a>
                    </div>
                </div>
            </div>
            <table class="table table-bordered table-striped mb-none" id="datatable-default">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Image Order</th>
                        <%--<th>Is Banner</th>--%>
                        <th>Is Home</th>
                        <th>Is Active</th>
                        <th>Created Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="tbyImageInfo">
                </tbody>
            </table>
        </div>
         <div class="modal fade" id="divImgInfo" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Image Details</h4>
        </div>
        <div class="modal-body">
           <form  class="form-horizontal mb-lg" novalidate="novalidate">
                        <div class="form-group mt-lg">
                            <label class="col-sm-3 control-label">Image Name</label>
                            <div class="col-sm-9">
                                <input id="txtImageName" type="text" name="name" class="form-control" placeholder="Type image name..." required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Image Discription</label>
                            <div class="col-sm-9">
                                <input id="txtImageDis" type="text" class="form-control" placeholder="Type image discription..." required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Choose Image</label>
                            <div class="col-sm-9">
                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                    <input type="hidden">
                                    <div class="input-append">
                                        <div class="uneditable-input">
                                            <i class="fa fa-file fileupload-exists"></i>
                                            <span class="fileupload-preview"></span>
                                        </div>
                                        <span class="btn btn-default btn-file">
                                            <span class="fileupload-exists">Change</span>
                                            <span class="fileupload-new">Select file</span>
                                            <input type="file" id="fileImage">
                                        </span>
                                        <a href="#" class="btn btn-default fileupload-exists" data-dismiss="fileupload">Remove</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Image Order</label>
                            <div class="col-sm-9">
                                <input id="txtImageOrder" type="number" class="form-control" min="1" />
                            </div>
                        </div>
                       <%-- <div class="form-group">
                            <label class="col-sm-3 control-label"></label>
                            <div class="col-sm-6">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="chkHomeImage" value="option1" checked="">Is Home Image</label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadios" id="chkBannerImage" value="option2">Is Banner Image</label>
                                </div>
                            </div>
                        </div>--%>
               <div class="form-group">
                            <label class="col-sm-3 control-label"></label>
                            <div class="col-sm-6">
                                <div class="checkbox-custom checkbox-primary">
                                    <input type="checkbox" checked="checked" id="chkHomeImage">
                                    <label for="checkboxExample2">Is Home Image</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"></label>
                            <div class="col-sm-6">
                                <div class="checkbox-custom checkbox-primary">
                                    <input type="checkbox" checked="checked" id="chkActive">
                                    <label for="checkboxExample2">Activate</label>
                                </div>
                            </div>
                        </div>
                    </form>
        </div>
        <div class="modal-footer">
             <button class="btn btn-primary modal-confirm" type="button" id="btnSubmit">Submit</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>



         <!-- Modal Animation -->
	<div class="modal fade" id="divImgae" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="ImgName"></h4>
        </div>
        <div class="modal-body">
            <img src="assets/images/noImage.png" id="viewImage"/>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
    </section>
    <input type="hidden" value="0" id="hdImageId" />
    <!-- Specific Page Vendor -->
    <script src="assets/vendor/jquery/jquery.js"></script>
    <script src="assets/vendor/select2/select2.js"></script>
    <script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>
    <script src="assets/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
    <script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
    <script src="assets/vendor/magnific-popup/magnific-popup.js"></script>


    <!-- Theme Custom -->
    <script src="assets/javascripts/theme.custom.js"></script>

    <!-- Theme Initialization Files -->
    <script src="assets/javascripts/theme.init.js"></script>
    <!-- Specific Page Vendor -->
    <script src="assets/vendor/pnotify/pnotify.custom.js"></script>
    
    <!-- Examples -->
    <script src="assets/javascripts/tables/datatables.default.js"></script>
    <script src="assets/javascripts/tables/examples.datatables.row.with.details.js"></script>
    <script src="assets/javascripts/tables/examples.datatables.tabletools.js"></script>
    <script src="assets/javascripts/ui-elements/examples.modals.js"></script>
    <script src="assets/vendor/jquery-autosize/jquery.autosize.js"></script>
    <script src="assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
      <script>
          var BannerImageStatus = 0, HomeImageStatus = 0, ImageStatus = 0, ActiveBannerImgCount = 0, ActiveHomeImgCount = 0;
          var imgType = 1,status = 0,tempOrderStatus=0;
          $(document).ready(function () {
              //---------------- load grid
              GetImageInfo(0);
              $("#btnAdd").click(function () {
                  $("#divImgInfo").modal('show');
              });
              //---------------- check image type home/other image
              $('#chkHomeImage').click(function () {
                  if ($("#chkHomeImage").prop("checked")) {
                      HomeImageStatus = 1;
                      imgType = 1; //home
                  }
                  else
                      imgType = 0; //other
              });
              //---------------- check image order exists or not
              $("#txtImageOrder").change(function () {
                  if ($("#chkHomeImage").prop("checked")) {
                      CheckImageOrderStatus(imgType)
                  }

              });
              //---------------- save img info
              $("#btnSubmit").click(function () {
                  status = 1; //validation status
                  ActiveHomeImgCount = localStorage.getItem("ActiveHomeImgCount");
                  if ($("#chkHomeImage").prop("checked")) {
                      HomeImageStatus = 1;
                      if (ActiveHomeImgCount > 6) {
                          status = 0;
                          alert("Exceed the active image limt");
                      }
                      //else
                      //CheckImageOrderStatus(1);
                  }
                  else
                      HomeImageStatus = 0;


                  if ($("#chkActive").prop('checked') == true)
                      ImageStatus = 1;
                  else
                      status = 1;

                  if (status!= 0) {
                      status = Valiations();
                      if (status == 1) {
                          var ImgInfo = {
                              ImageId: $("#hdImageId").val(),
                              ImageName: $("#txtImageName").val(),
                              ImageDiscription: $("#txtImageDis").val(),
                              ImageOrder: $("#txtImageOrder").val(),
                              //BannerImageStatus: BannerImageStatus,
                              HomeImageStatus: HomeImageStatus,
                              ImageStatus: ImageStatus,
                              UploadType:2
                          };
                          $.ajax({
                              type: "POST",
                              url: "ImageMaster.aspx/UpdateImageInfo",
                              data: JSON.stringify({ ImgInfo: ImgInfo }),
                              contentType: "application/json; charset=utf-8",
                              dataType: "json",
                              async: false,
                              success: function (data) {
                                  $("#hdImageId").val(0);
                                  if (data.d > 0) {
                                      if ($("#fileImage").val()!="")
                                          ImageUpload(data.d);
                                      else
                                          alert('updated');
                                  }
                                  else
                                      alert('Error on data update');
                              },
                              error: function (data) {
                                  alert('unbale to post data');
                              }
                          });
                      }
                  }
              });
              $("#btnCancel").click(function () {
                  Reset();
              });

              //--------------functions
              function CheckImageOrderStatus(imgType) {
                  if ($("#txtImageOrder").val() != "") {
                      var ImageOrderStatus = SearchImageInfo($("#txtImageOrder").val(), imgType);
                      if (ImageOrderStatus != "0") {
                          alert("Not avail this order")
                          $("#txtImageOrder").val('');
                          status = 0;
                      }
                  }
                  else {
                      alert("Enter image order");
                      status = 0;
                  }
              }
              function Valiations() {
                  var vstatus = 1;
                  if ($("#txtImageName").val() == '') {
                      alert("Enter image name");
                      vstatus = 0;
                  }
                  else if ($("#fileImage").val() == '') {
                      alert("Choose image");
                      vstatus = 0;
                  }
                  else if ($("#txtImageOrder").val() == '') {
                      alert("Enter image order");
                      vstatus = 0;
                  }
                  return vstatus; 
              }
              function Reset() {
                  $("#txtImageName").val('');
                  $("#txtImageDis").val('');
                  $("#fileImage").val('');
                  $("#txtImageOrder").val('');
              }
              function ImageUpload(ImageId) {
                  var fileUpload = $("#fileImage").get(0);
                  var files = fileUpload.files;

                  var imgData = new FormData();
                  for (var i = 0; i < files.length; i++) {
                      imgData.append(files[i].name, files[i]);
                  }
                  $.ajax({
                      type: "POST",
                      url: "Handlers/FilesUpload.ashx?q=ImageUpload&ImageId=" + ImageId + "&IsHome=" + HomeImageStatus,
                      data: imgData,
                      contentType: false,
                      processData: false,
                      success: function (result)
                      {
                          if (result > 0) {
                              GetImageInfo(0);
                              $("#divImgInfo").modal('hide');
                              alert('Success')
                          }
                          else if (result==-1){
                              alert('Unbale to update image')
                          }
                          else if (result == -1) {
                              alert('Unbale to delete image')
                          }
                          Reset();
                      },
                      error: function (err) {
                          alert(err.statusText)
                      }
                  });
              }
              function GetImageInfo(ImageId)
                  {
                  $.ajax({
                      type: "POST",
                      url: "ImageMaster.aspx/GetImageInfo",
                      data: "{'ImageId':" + ImageId + "}",
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      async: false,
                      success: function (data) {
                          //localStorage.setItem("ActiveBannerImgCount", data.d.ActiveBannerImgCount);
                          localStorage.setItem("ActiveHomeImgCount", data.d.ActiveHomeImgCount);
                          var ImgList = data.d.listImageInfo;
                          if (ImgList.length > 0) {
                              var str = '';
                              for (var i = 0; i <= ImgList.length-1; i++) {
                                  str += '<tr class="gradeA" data-ImageId=' + ImgList[i].ImageId+'>';
                                  str += '<td>'+ImgList[i].ImageName+'</td>';
                                  str += '<td>' + ImgList[i].ImageDiscription+'</td>';
                                  str += '<td>' + ImgList[i].ImageOrder + '</td>';

                                  //if (ImgList[i].BannerImageStatus == 1)
                                  //    str += '<td><input type="checkbox" checked="checked"></td>';
                                  //else 
                                  //    str += '<td><input type="checkbox"></td>';
                                  if (ImgList[i].HomeImageStatus == 1)
                                      str += '<td>Yes</td>';
                                  else
                                      str += '<td>No</td>';
                                  if (ImgList[i].ImageStatus == 1)
                                      str += '<td>Yes</td>';
                                  else
                                      str += '<td>No</td>';

                                  str += '<td>' + ImgList[i].CreatedDate + '</td>';
                                  str += '<td><a style="padding: 5px;" class="mb-xs mt-xs mr-xs modal-with-move-anim btn btn-default" href="javascript:void(0);" onclick="ViewImage(' + ImgList[i].ImageId + ')"><i class="fa fa-image"></i></a>';
                                  str += '<a style="padding: 5px;" class="mb-xs mt-xs mr-xs modal-with-move-anim btn btn-default" href="javascript:void(0)" onclick="EditImageInfo(' + ImgList[i].ImageId + ')"><i class="fa fa-pencil"></i></a>';
                                  str += '<a style="padding: 5px;" class="mb-xs mt-xs mr-xs modal-with-move-anim btn btn-default" href="javascript:void(0)" onclick="DeleteImageInfo(' + ImgList[i].ImageId + ')"><i class="fa fa-trash-o"></i></a></td>';
                                  str += '</tr>';
                              }
                              $("#tbyImageInfo").empty().append(str);
                          }
                          else {
                              //not data
                          }
                      },
                      error: function (data) {
                          alert('unbale to post data');
                      }
                  });
              }
              function SearchImageInfo(ImageOrder, ImageIdOrImageType) {
                  var result = '';
                  $.ajax({
                      type: "POST",
                      url: "ImageMaster.aspx/SearchImageInfo",
                      data: "{'ImageOrder':" + ImageOrder + ",'ImageIdOrImageType':" + ImageIdOrImageType + "}",
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      async: false,
                      success: function (data) {
                          result = data.d;
                      },
                      error: function () {
                          alert('unbale to post data');
                      }
                  });
                  return result;
              }
              ViewImage = function (ImgId) {
                  var filePath = "";
                  filePath = SearchImageInfo(0, ImgId);
                  $("#ImgName").html('Image');
                  $('#viewImage').attr('src', filePath); // + "?" + Math.random()
                  $("#divImgae").modal('show');
              }
              EditImageInfo = function (ImgId) {
                  $("#hdImageId").val(ImgId);
                  $.ajax({
                      type: "POST",
                      url: "ImageMaster.aspx/GetImageInfo",
                      data: "{'ImageId':" + ImgId + "}",
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      async: false,
                      success: function (data) {
                          var ImgList = data.d.listImageInfo;
                          if (ImgList.length > 0) {
                              $("#txtImageName").val(ImgList[0].ImageName);
                              $("#txtImageDis").val(ImgList[0].ImageDiscription);
                              $("#txtImageOrder").val(ImgList[0].ImageOrder);
                              if (ImgList[0].HomeImageStatus == 1)
                                  $("#chkHomeImage").prop("checked", true);
                              else
                                  $("#chkHomeImage").prop('checked', false);

                              if (ImgList[0].ImageStatus == 1)
                                  $("#chkActive").prop("checked", true);
                              else
                                  $("#chkActive").prop("checked", false);
                              
                              $("#divImgInfo").modal('show');
                          }
                          else {
                              //not data
                          }
                      },
                      error: function (data) {
                          alert('unbale to get data');
                      }
                  });
              }
              DeleteImageInfo = function (ImgId) {
                  var result = 0;
                  $.ajax({
                      type: "POST",
                      url: "ImageMaster.aspx/DeleteImageInfo",
                      data: "{'ImageId':" + ImgId + "}",
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      async: false,
                      success: function (data) {
                          result = data.d;
                          if (result > 0)
                              alert('done');
                          else if (result == -1)
                              alert('unable to delete image');
                          else
                              alert('unable to delete');
                          GetImageInfo(0);
                      },
                      error: function () {
                          alert('unbale to post data');
                      }
                  });
              }
             
          });
      </script>
    </asp:Content>
