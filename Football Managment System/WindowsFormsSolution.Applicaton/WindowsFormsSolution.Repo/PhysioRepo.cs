using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WindowsFormsSolution.Data;

using WindowsFormsSolution.Entity;

namespace WindowsFormsSolution.Repo
{
    public class PhysioRepo
    {
        public List<Physio> GetAll() 
        {
           var pList = new List<Physio>(); 

            var sql = "select * from physioo;";
            var dt = DataAccess.GetDataTable(sql);
          
            for (int index = 0; index < dt.Rows.Count;index++ )
            {
                Physio p = ConvertToEntity(dt.Rows[index]);
                pList.Add(p);
            }
            return pList;
        }
        public bool Save(Physio pro)
        {
            try
            {
                string query = "select * from physioo where playerid = '" + pro.playerid + "';";
                var dt = DataAccess.GetDataTable(query);
               query = "Update physioo set injury = '"+pro.injury+"',fitness = '"+pro.fitness+"' where playerid = '"+pro.playerid+"';";
                
                int count = DataAccess.ExecuteUpdateQuery(query);
                if(count >=1){return true;}
                else{ return false;
                }
            }
            catch(Exception exception){
            return false;
            
            }
            }

        private Physio ConvertToEntity(DataRow row){
        
            if (row == null) { return null; }
        
        var p = new Physio();
        p.playerid=  row["playerid"].ToString();
        p.name= row["name"].ToString();
        p.injury = row["injury"].ToString();
        p.fitness = row["fitness"].ToString();
        p.needs = row["needs"].ToString();
        return p;
    }
       
}
}
 
