/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Factory;

import Model.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Test {

    public static int save(User obj) {
        int i = 0;
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        s.save(obj);
        t.commit();
        s.close();
        return i;
    }

    public static List<User> read() {

        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List li = s.createQuery("from User").list();
        t.commit();
        s.close();
        return li;
    }

    public static User edit(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        User ob = (User) s.get(User.class, id);
        t.commit();
        s.close();
        return ob;
    }

    public static int update(User obj) {
        int i = 0;
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        s.update(obj);
        t.commit();
        s.close();
        return i;
    }
    
     public static int delete(int id) {
        int i = 0;
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        User ob = (User) s.get(User.class, id);
        s.delete(ob);
        t.commit();
        s.close();
        return i;
    }
}
