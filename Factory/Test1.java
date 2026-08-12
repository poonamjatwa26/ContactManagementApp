
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Factory;

import Model.Contact;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Test1 {

    public static int save(Contact obj) {
        int i = 0;
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        s.save(obj);
        t.commit();
        s.close();
        return i;
    }

    public static List<Contact> read() {

        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();

        List li = s.createQuery("from Contact").list();
        t.commit();
        s.close();
        return li;
    }

    public static Contact search(String firstName) {

        Session session = Factory.getSessionFactory().openSession();

        Query q = session.createQuery("from Contact where firstName=:fname");
        q.setParameter("fname", firstName);

        Contact ob = (Contact) q.uniqueResult();

        session.close();

        return ob;
    }

    public static Contact edit(int id) {
        Session s = Factory.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Contact ob = (Contact) s.get(Contact.class, id);
        t.commit();
        s.close();
        return ob;
    }
    
    public static int update(Contact obj) {
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
        Contact ob = (Contact) s.get(Contact.class, id);
        s.delete(ob);
        t.commit();
        s.close();
        return i;
    }
}
