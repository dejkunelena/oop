package childDB.model;

import childDB.dao.WorkingWithChild;
import childDB.entities.Child;
import childDB.entities.Institution;
import childDB.entities.User;

import java.util.*;

public class Model {
    private static Model instance = new Model();
    private User user;
    private static List<Child> children ;

    public static void setInstance(Model instanse) {
        Model.instance = instanse;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public  List<Child> getChildren() {
        return WorkingWithChild.getAllChild(user.getInstId());
    }

    public void setChildren(List<Child> children) {
        this.children = children;
    }

    public Institution getInst() {
        return inst;
    }

    public void setInst(Institution inst) {
        this.inst = inst;
    }

    private Institution inst;

    public static Model getInstance(){
        return instance;
    }

    private Model(){
        user = new User();
        children = new ArrayList<>();
    }

    public User getUser(){
        return user;
    }
    
    public void add(Child child) {
        children.add(child);
    }

}
