package childDB.entities;

import java.util.Date;
import java.util.List;

public class Child {
    private int ID;
    private String FirstName;
    private String LastName;
    private String MiddleName;
    private boolean IsMan;
    private Date Birthday;
    private int InstID;
    private String Address;
    private List<Integer> Diagnoses;
    private int ClassOrCource;
    //инвалидность
    private int Disability;
    private boolean IsNeedsHelp;
    private int TypeOfHelpInCenter;
    private int TypeOfHelpInSchool;


    private int City;
    //форма опеки
    private int FormOfCustody;
    private boolean IsCompleteFamily;
    private List<Integer> Mother;
    private List<Integer> Father;
    //многодетная
    private boolean IsLargeFamily;
    //малообеспеченная
    private boolean IsLowIncomeFamily;

    //дата учета
    private Date AccountingDate;

    public Date getDateOfLastChange() {
        return DateOfLastChange;
    }

    public void setDateOfLastChange(Date dateOfLastChange) {
        DateOfLastChange = dateOfLastChange;
    }

    private Date DateOfLastChange;
    private String Notes;

    public Child() {
    }

    public int getTypeOfHelpInSchool() {
        return TypeOfHelpInSchool;
    }

    public void setTypeOfHelpInSchool(int typeOfHelpInSchool) {
        TypeOfHelpInSchool = typeOfHelpInSchool;
    }

    public int getFormOfCustody() {
        return FormOfCustody;
    }

    public void setFormOfCustody(int formOfCustody) {
        FormOfCustody = formOfCustody;
    }

    public boolean isCompleteFamily() {
        return IsCompleteFamily;
    }

    public void setCompleteFamily(boolean completeFamily) {
        IsCompleteFamily = completeFamily;
    }

    public List<Integer> getMother() {
        return Mother;
    }

    public void setMother(List<Integer> mother) {
        Mother = mother;
    }

    public List<Integer> getFather() {
        return Father;
    }

    public void setFather(List<Integer> father) {
        Father = father;
    }

    public boolean isLargeFamily() {
        return IsLargeFamily;
    }

    public void setLargeFamily(boolean largeFamily) {
        IsLargeFamily = largeFamily;
    }

    public boolean isLowIncomeFamily() {
        return IsLowIncomeFamily;
    }

    public void setLowIncomeFamily(boolean lowIncomeFamily) {
        IsLowIncomeFamily = lowIncomeFamily;
    }

    public Date getAccountingDate() {
        return AccountingDate;
    }

    public void setAccountingDate(Date accountingDate) {
        AccountingDate = accountingDate;
    }

    public String getNotes() {
        return Notes;
    }

    public void setNotes(String notes) {
        Notes = notes;
    }

    public int getID() {

        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String firstName) {
        FirstName = firstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String lastName) {
        LastName = lastName;
    }

    public String getMiddleName() {
        return MiddleName;
    }

    public void setMiddleName(String middleName) {
        MiddleName = middleName;
    }

    public boolean isMan() {
        return IsMan;
    }

    public void setMan(boolean man) {
        IsMan = man;
    }

    public Date getBirthday() {
        return Birthday;
    }

    public void setBirthday(Date birthday) {
        Birthday = birthday;
    }

    public int getInstID() {
        return InstID;
    }

    public void setInstID(int instID) {
        InstID = instID;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public List<Integer> getDiagnoses() {
        return Diagnoses;
    }

    public void setDiagnoses(List<Integer> diagnoses) {
        Diagnoses = diagnoses;
    }

    public int getClassOrCource() {
        return ClassOrCource;
    }

    public void setClassOrCource(int classOrCource) {
        ClassOrCource = classOrCource;
    }

    public int getDisability() {
        return Disability;
    }

    public void setDisability(int disability) {
        Disability = disability;
    }

    public boolean isNeedsHelp() {
        return IsNeedsHelp;
    }

    public void setNeedsHelp(boolean needsHelp) {
        IsNeedsHelp = needsHelp;
    }

    public int getCity() {
        return City;
    }

    public void setCity(int city) {
        City = city;
    }


    public int getTypeOfHelpInCenter() {
        return TypeOfHelpInCenter;
    }

    public void setTypeOfHelpInCenter(int typeOfHelpInCenter) {
        TypeOfHelpInCenter = typeOfHelpInCenter;
    }
}
