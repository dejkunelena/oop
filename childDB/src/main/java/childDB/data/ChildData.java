package childDB.data;

import childDB.entities.Location;

import java.util.ArrayList;
import java.util.Arrays;

public class ChildData {

    public static int ID = -1;

    public static int instId = -1;

    public static ArrayList<String> diagnoses = new ArrayList<String>(
            Arrays.asList("Дислалия", "Алалия","Афазия","Заикание")
    );

    public static ArrayList<String> formOfCustody = new ArrayList<String>(
            Arrays.asList("Биологическая семья", "Госопека","Частная опека")
    );

    public static ArrayList<String> parentInfo = new ArrayList<String>(
            Arrays.asList("Работает", "Ухаживает за ребенком","Безработный(-а)",
                    "Недееспособен(-а)", "Осужден(-а)", "Уклоняется от воспитания",
                    "Злоупотребляет алкоголем", "Употребляет наркотики", "Другое")
    );

    public static ArrayList<String> disability = new ArrayList<String>(
            Arrays.asList("Инвалид", "Инвалид с детства", "1-я группа","2-я группа","3-я группа")
    );



    public static ArrayList<String> instTypes = new ArrayList<String>(
            Arrays.asList("Дошкольное учреждение","Спецаильное ДУ",
                    "Общеобразовательная школа", "Детский дом",
                    "ЦКРОиР")
    );

    public static ArrayList<String> formOfHelpInCenter = new ArrayList<String>(
            Arrays.asList("Обучающийся на дому дошкольник",
                    "Спецкласс в ЦКРОиР", "Консультирован в ЦКРОиР")
    );

    public static ArrayList<String> formOfHelpInSchool = new ArrayList<String>(
            Arrays.asList("Спедиальная группа в дошкольном учреждении",
                    "Интергированная группа в ДУ", "Дошкольники ДУ на дому"
            ));





}


