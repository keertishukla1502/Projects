//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineShoppingApi.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tbl_SubCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tbl_SubCategory()
        {
            this.Tbl_Product = new HashSet<Tbl_Product>();
        }
    
        public int SubCategoryId { get; set; }
        public Nullable<int> CategoryId { get; set; }
        public string SubCategoryName { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDelete { get; set; }
    
        public virtual Tbl_Category Tbl_Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tbl_Product> Tbl_Product { get; set; }
    }
}
