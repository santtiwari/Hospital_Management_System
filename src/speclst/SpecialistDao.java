package speclst;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import max.DBConnect;

public class SpecialistDao {
	public boolean addSpecialist(String spec)
	{
		boolean f=false;
		try {
			String sql="insert into specialist (spec_name) values(?)";
			Connection con = DBConnect.getconn();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, spec);
			int n = ps.executeUpdate();
			if(n==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List <Specialist> getAllSpecialist()
	{
		List <Specialist> list = new ArrayList<Specialist>();
		Specialist s=null;
		{
			try {
				String sql="select * from specialist";
				Connection con = DBConnect.getconn();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					s = new Specialist();
					s.setId(rs.getInt(1));
					s.setSpecialistName(rs.getString(2));
					list.add(s);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

}
