using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LoginPageMVC.Models
{
    public class QuestionModel : QuizOption
    {
        public int QuestionId { get; set; }
        [Required]
        [Display(Name = "Question")]
        public string Text { get; set; }
        [Required]
        [Display(Name = "Answer")]
        public string CurrectAnswer { get; set; }
        public List<QuizOption> Option { get; set; }
    }

    public class QuizOption
    {
        //public int OptionId { get; set; }
        [Required]
        public string Options { get; set; }
    }

    public class RoleModel
    {    
        public string id { get; set; }
        public int RoleId { get; set; }
    }
}