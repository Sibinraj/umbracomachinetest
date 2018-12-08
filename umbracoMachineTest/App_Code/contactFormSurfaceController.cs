using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;
//using Umbraco.Web.Mvc;
using umbraco;
using System.Text;
//using System.Net.Mail;
using System.Configuration;
using System.Security.Cryptography;
using System.Net.Mail;
namespace MyControllers
{
    public class contactFormSurfaceController : Umbraco.Web.Mvc.SurfaceController
    {
        [ChildActionOnly]
        public ActionResult ShowForm()
        {
            return PartialView("ContactForm", new contactModel());
        }

        public ActionResult HandleFormPost(contactModel model)
        {
            var newComent = Services.ContentService.CreateContent(model.contactName + " " + DateTime.Now.ToString("dd-MM-yyyy HH:mm"), CurrentPage.Id, "listContact");
            newComent.SetValue("contactName", model.contactName);
            newComent.SetValue("email", model.email);
            newComent.SetValue("phone", model.phone);
            newComent.SetValue("subject", model.subject);
            newComent.SetValue("message", model.message);
            var result = Services.ContentService.SaveAndPublishWithStatus(newComent);
            if (result.Success)
            {
                return RedirectToCurrentUmbracoPage();
            }
            else
            {
                return RedirectToCurrentUmbracoPage();
            }
        }
    }
}