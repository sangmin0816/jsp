package test;

import test.DBCC;

import java.sql.Connection;
import java.sql.SQLException;

public class MariaDBC extends DBCC {
    public MariaDBC() {
        super.setURL("jdbc:mariadb://" +super.DNS+":"+super.PORT+"/"+super.getNAME());
        super.setDRIVER("org.mariadb.jdbc.Driver");
    }
}
