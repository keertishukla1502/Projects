using Newtonsoft.Json;
using OnlineShoppingApi.Controllers;
using OnlineShoppingStore.DAL;
using OnlineShoppingStore.Models;
using OnlineShoppingStore.Repository;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static System.Net.WebRequestMethods;

namespace OnlineShoppingStore.Controllers
{
    public class AdminController : Controller
    {

        public GenericUnitOfWork _unitOfWork = new GenericUnitOfWork();

        // GET: Admin

        public List<SelectListItem> GetCategory()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            var cat = _unitOfWork.GetRepositoryInstance<Tbl_Category>().GetAllRecords();
            foreach (var item in cat)
            {
                list.Add(new SelectListItem { Value = item.CategoryId.ToString(), Text = item.CategoryName });
            }
            return list;
        }

        public ActionResult Dashbord()
        {
            return View();
        }

        public ActionResult Categories()
        {
            List<Tbl_Category> allcategories = _unitOfWork.GetRepositoryInstance<Tbl_Category>().GetAllRecordsIQueryable().Where(i => i.IsDelete == false).ToList();
            return View(allcategories);
        }

        public ActionResult AddCategory()
        {
            return UpdateCategory(0);
        }

        public ActionResult UpdateCategory(int categoryId)
        {
            CategoryDetail cd;
            if (categoryId != null)
            {
                cd = JsonConvert.DeserializeObject<CategoryDetail>(JsonConvert.SerializeObject(_unitOfWork.GetRepositoryInstance<Tbl_Category>().GetFirstorDefault(categoryId)));
            }
            else
            {
                cd = new CategoryDetail();
            }
            return View("UpdateCategory", cd);

        }

        public ActionResult CategoryEdit(int catId)
        {
            return View(_unitOfWork.GetRepositoryInstance<Tbl_Category>().GetFirstorDefault(catId));
        }
        [HttpPost]
        public ActionResult CategoryEdit(Tbl_Category tbl)
        {
            _unitOfWork.GetRepositoryInstance<Tbl_Category>().Update(tbl);
            return RedirectToAction("Categories");
        }
        public ActionResult Product()
        {

            ValuesController valuesController = new ValuesController();
             return View(_unitOfWork.GetRepositoryInstance<Tbl_Product>().GetProduct());
            //return View(valuesController.GetProduct());

             
        }
        public ActionResult ProductEdit(int productId)
        {
            ViewBag.CategoryList = GetCategory();
            return View(_unitOfWork.GetRepositoryInstance<Tbl_Product>().GetFirstorDefault(productId));
        }

        [HttpPost]
        public ActionResult ProductEdit(Tbl_Product tbl, HttpPostedFileBase file, HttpPostedFileBase file2, HttpPostedFileBase file3)
        {
            string pic = null;
            string pic2 = null;
            string pic3 = null;
            if (file != null)
            {
                pic = System.IO.Path.GetFileName(file.FileName);
                string path = System.IO.Path.Combine(Server.MapPath("~/ProductImg/"), pic);
                
                file.SaveAs(path);
            }

            if (file2 != null)
            {
                pic2 = System.IO.Path.GetFileName(file2.FileName);
                string path = System.IO.Path.Combine(Server.MapPath("~/ProductImg/"), pic2);

                file2.SaveAs(path);
            }
            if (file3 != null)
            {
                pic3 = System.IO.Path.GetFileName(file3.FileName);
                string path = System.IO.Path.Combine(Server.MapPath("~/ProductImg/"), pic3);

                file3.SaveAs(path);
            }
           
            tbl.ProductImage2 = file2 != null ? pic2 : tbl.ProductImage2; 
            tbl.ProductImage3 = file3 != null ? pic3 : tbl.ProductImage3; 
            tbl.ProductImage = file != null ? pic : tbl.ProductImage; 
            _unitOfWork.GetRepositoryInstance<Tbl_Product>().Update(tbl);
            return RedirectToAction("Product");
        }



        public ActionResult ProductAdd()
        {
            ViewBag.CategoryList = GetCategory();
            return View();
        }
        [HttpPost]
        public ActionResult ProductAdd(Tbl_Product tbl, HttpPostedFileBase file, HttpPostedFileBase file2, HttpPostedFileBase file3)
        {

            string pic = null;
            string pic2 = null;
            string pic3 = null;
            if (file != null)
            {
                pic = System.IO.Path.GetFileName(file.FileName);
                string path = System.IO.Path.Combine(Server.MapPath("~/ProductImg/"), pic);
            
                file.SaveAs(path);
            }
            if (file2 != null)
            {
                pic2 = System.IO.Path.GetFileName(file2.FileName);
                string path = System.IO.Path.Combine(Server.MapPath("~/ProductImg/"), pic2);

                file2.SaveAs(path);
            }
            if (file3 != null)
            {
                pic3 = System.IO.Path.GetFileName(file3.FileName);
                string path = System.IO.Path.Combine(Server.MapPath("~/ProductImg/"), pic3);

                file3.SaveAs(path);
            }
            tbl.ProductImage = pic;
            tbl.ProductImage2 = pic2;
            tbl.ProductImage3 = pic3;
            tbl.CreatedDate = DateTime.Now;
            _unitOfWork.GetRepositoryInstance<Tbl_Product>().Add(tbl);
            return RedirectToAction("Product");
        }
    }
}
