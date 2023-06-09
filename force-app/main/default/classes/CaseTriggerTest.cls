@isTest
public class CaseTriggerTest {
    @testSetup
    public static void buildData(){
        Account acc = new Account(Name = 'New Account');
        insert acc;
        Case oldcase = new Case(Status='Working', Origin='Phone', AccountId=acc.Id);
        insert oldcase;
        
        List<Case> newcases = new List<Case>();
        Case case2 = new Case(Status='New', Origin='Phone', AccountId=acc.Id, Priority='Low');        
        newcases.add(case2);
        Case case3 = new Case(Status='New', Origin='Email', AccountId=acc.Id);  
        newcases.add(case3);
        Case case4 = new Case(Status='New', Origin='Phone', Priority='Medium');  
        newcases.add(case4);
        insert newcases;
    }
    @isTest
    public static void test(){
        Case case2 = [SELECT ParentId FROM Case WHERE Priority = 'Low' LIMIT 1];
        Case oldcase = [SELECT Id FROM Case WHERE Status = 'Working' LIMIT 1];
        System.assert(case2.ParentId == oldcase.Id);
        Case case3 = [SELECT ParentId FROM Case WHERE Origin = 'Email' LIMIT 1];
        System.assert(case3.ParentId == null); 
        Case case4 = [SELECT ParentId FROM Case WHERE Priority = 'Medium' LIMIT 1];
        System.assert(case4.ParentId == null); 
    }
}