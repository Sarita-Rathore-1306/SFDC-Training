/*
Purpose        : This class has been created to practice Maps,List and Set.
Created Date   : 11/25/2024
Created By     : Sarita Rathore
Revision_Log   : V1.0
*/
public with sharing class Collection {
/*
Description    : This method gives the employees in each department.
Return         : Map<String,List<String>>
Created Date   : 11/25/2024
Created By     : Sarita Rathore
*/
    public static Map<String,List<String>> mapCollection(){
        Map<String,List<String>> employeesOfDepartment=new Map<String,List<String>>();
        employeesOfDepartment.put('HR',new List<String>{'Ruchi','Aditi','Isha'});
        employeesOfDepartment.put('Finance',new List<String>{'Anurag','Aman','Rahul'});
        employeesOfDepartment.put('Technical',new List<String>{'Sunil','Shivam','Sarita'});
        return  employeesOfDepartment;
    }
/*
Description    : This methods gives the union,intersection and differnece of two group of students.
Return         : void
Created Date   : 11/25/2024
Created By     : Sarita Rathore
*/
    public static void setCollection(){
        Set<String> student1=new Set<String>{'David','Bobby','Alice','Hell'};
        Set<String> student2=new Set<String>{'Imli','David','Priya','Alice','Jack'};
        
        //Find Union
        Set<String> unionOfString=new Set<String>(student1);
        unionOfString.addAll(student2);
        System.debug('Union of String'+ unionOfString);
        
        //Find Intersection
        Set<String> intersectionOfString=new Set<String>(student1);
        intersectionOfString.retainAll(student2);
        System.debug('Intersection of Strings' + intersectionOfString);

        //Find Difference
        Set<String> differenceOfString=new Set<String>(unionOfString);
        differenceOfString.removeAll(intersectionOfString);
        System.debug('Difference of Strings' + differenceOfString);
    }

/*
Description    : This method gives the sorted list of integers.
Return         : List<Integer>
Created Date   : 11/25/2024
Created By     : Sarita Rathore
*/
    public static List<Integer> listCollection(){
        List<Integer> listOfIntegers=new List<Integer>();
        listOfIntegers.add(1);
        listOfIntegers.add(14);
        listOfIntegers.add(67);
        listOfIntegers.add(45);
        listOfIntegers.add(78);
        listOfIntegers.add(81);
        listOfIntegers.add(19);
        listOfIntegers.add(20);
        listOfIntegers.add(11);
        listOfIntegers.sort();

        return listOfIntegers;
    }
}