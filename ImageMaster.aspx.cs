using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConstructFore.admin
{
    public partial class ImageMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        [System.Web.Services.WebMethod(enableSession: true)]
        public static ImageMasterInfo GetImageInfo(int ImageId=0)
        {
            ImageMasterModel img = new ImageMasterModel();
            return img.GetImageInfo(ImageId);
        }

        [System.Web.Services.WebMethod(enableSession: true)]
        public static int UpdateImageInfo(ImageInfo ImgInfo)
        {
            ImageMasterModel img = new ImageMasterModel();
            int result = 0;
            if(ImgInfo.UploadType==2 && ImgInfo.ImageId>0)
                result= img.UpdateImageInfo(ImgInfo);
            else 
                result = img.InsertImageInfo(ImgInfo);
            return result;
        }
        [System.Web.Services.WebMethod(enableSession: true)]
        public static string SearchImageInfo(int ImageOrder=0,int ImageIdOrImageType = 0)
        {
            ImageMasterModel img = new ImageMasterModel();
            return img.SearchImageInfo(ImageOrder, ImageIdOrImageType);
        }
        [System.Web.Services.WebMethod(enableSession: true)]
        public static int DeleteImageInfo(int ImageId=0)
        {
            ImageMasterModel img = new ImageMasterModel();
            return img.DeletImageInfo(ImageId);
        }
    }
}
