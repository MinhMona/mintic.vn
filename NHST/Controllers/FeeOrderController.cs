using MB.Extensions;
using NHST.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using WebUI.Business;

namespace NHST.Controllers
{
    public class FeeOrderController
    {
        public static tbl_FeeOrder GetByID(int ID)
        {
            using (var dbe = new NHSTEntities())
            {
                var c = dbe.tbl_FeeOrder.Where(p => p.ID == ID).FirstOrDefault();
                if (c != null)
                {
                    return c;
                }
                else
                    return null;
            }
        }

        public static tbl_FeeOrder GetAllMainOrder(int WareHouseFromID, int WareHouseID, int ShipppingTypeID, int LevelID)
        {
            using (var dbe = new NHSTEntities())
            {
                var cs = dbe.tbl_FeeOrder.Where(c => c.WareHouseFromID == WareHouseFromID && c.WareHouseID == WareHouseID && c.ShipppingTypeID == ShipppingTypeID && c.LevelID == LevelID).FirstOrDefault();
                if (cs != null)
                {
                    return cs;
                }
                else
                    return null;
            }
        }
        public static string Update(int ID, double Price, DateTime ModifiedDate, string ModifiedBy)
        {
            using (var dbe = new NHSTEntities())
            {
                var c = dbe.tbl_FeeOrder.Where(p => p.ID == ID).FirstOrDefault();
                if (c != null)
                {
                    c.Price = Price;
                    c.ModifiedDate = ModifiedDate;
                    c.ModifiedBy = ModifiedBy;
                    string kq = dbe.SaveChanges().ToString();
                    return kq;
                }
                else
                    return null;
            }
        }

        public static int GetTotal()
        {
            var sql = @"select Total=Count(*) ";
            sql += "from tbl_FeeOrder as a left join tbl_WarehouseFrom as b on a.WareHouseFromID = b.ID ";
            sql += "left join tbl_Warehouse as c on a.WareHouseID = c.ID ";
            sql += "left join tbl_ShippingTypeToWareHouse as d on d.ID = a.ShipppingTypeID ";
            var reader = (IDataReader)SqlHelper.ExecuteDataReader(sql);
            int a = 0;
            while (reader.Read())
            {
                if (reader["Total"] != DBNull.Value)
                    a = reader["Total"].ToString().ToInt(0);
            }
            reader.Close();
            return a;
        }

        public static List<WareHouseFee> GetAll(int pageIndex, int pageSize)
        {
            var sql = @"select* ";
            sql += "from tbl_FeeOrder ";
            sql += "order by ID desc OFFSET " + pageIndex + "*" + pageSize + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY ";
            List<WareHouseFee> list = new List<WareHouseFee>();
            var reader = (IDataReader)SqlHelper.ExecuteDataReader(sql);
            while (reader.Read())
            {
                var entity = new WareHouseFee();

                if (reader["ID"] != DBNull.Value)
                    entity.ID = reader["ID"].ToString().ToInt(0);

                int LevelID = 0;
                if (reader["LevelID"] != DBNull.Value)
                    LevelID = reader["LevelID"].ToString().ToInt(0);
                entity.LevelID = LevelID;

                string NameLevel = "";
                if (LevelID > 0)
                {
                    var level = UserLevelController.GetByID(LevelID);
                    if (level != null)
                    {
                        NameLevel = level.LevelName;
                    }    
                }
                entity.NameLevel = NameLevel;

                int WareHouseFromID = 0;
                if (reader["WareHouseFromID"] != DBNull.Value)
                    WareHouseFromID = reader["WareHouseFromID"].ToString().ToInt(0);
                entity.WareHouseFromID = WareHouseFromID;

                string KhoTQ = "";
                if (WareHouseFromID > 0)
                {
                    var khotq = WarehouseFromController.GetByID(WareHouseFromID);
                    if (khotq != null)
                    {
                        KhoTQ = khotq.WareHouseName;
                    }
                }
                entity.KhoTQ = KhoTQ;

                int WareHouseID = 0;
                if (reader["WareHouseID"] != DBNull.Value)
                    WareHouseID = reader["WareHouseID"].ToString().ToInt(0);
                entity.WareHouseID = WareHouseID;

                string KhoVN = "";
                if (WareHouseID > 0)
                {
                    var khovn = WarehouseController.GetByID(WareHouseID);
                    if (khovn != null)
                    {
                        KhoVN = khovn.WareHouseName;
                    }
                }
                entity.KhoVN = KhoVN;

                int ShipppingTypeID = 0;
                if (reader["ShipppingTypeID"] != DBNull.Value)
                    ShipppingTypeID = reader["ShipppingTypeID"].ToString().ToInt(0);
                entity.ShipppingTypeID = ShipppingTypeID;

                string PTVC = "";
                if (ShipppingTypeID > 0)
                {
                    var ship = ShippingTypeToWareHouseController.GetByID(ShipppingTypeID);
                    if (ship != null)
                    {
                        PTVC = ship.ShippingTypeName;
                    }
                }
                entity.PTVC = PTVC;

                if (reader["Price"] != DBNull.Value)
                    entity.Price = Convert.ToDouble(reader["Price"].ToString());

                list.Add(entity);
            }
            reader.Close();
            return list;
        }

        public partial class WareHouseFee
        {
            public int ID { get; set; }
            public int LevelID { get; set; }
            public int WareHouseFromID { get; set; }
            public int WareHouseID { get; set; }
            public int ShipppingTypeID { get; set; }
            public string NameLevel { get; set; }
            public string KhoTQ { get; set; }
            public string KhoVN { get; set; }
            public string PTVC { get; set; }
            public double Price { get; set; }       
        }
    }
}