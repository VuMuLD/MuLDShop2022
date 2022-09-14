package dao;

import Connect.DBConnect;
import model.DanhMuc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<DanhMuc> getDanhMuc(String ma_danh_muc) {
        List<DanhMuc> list = new ArrayList<>();
        String query = "select * from danh_muc Where danh_muc_cha = '"+ma_danh_muc+"'";
        try {
            conn = new DBConnect().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DanhMuc(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3)

                        )
                );
            }
        } catch (Exception e) {
        }
        return list;
    }
}
