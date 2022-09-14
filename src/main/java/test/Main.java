package test;

import dao.DAO;

public class Main {
    public static void main(String[] args) {
        DAO sp = new DAO();
        System.out.println(sp.getDanhMuc("4").size());
    }
}
