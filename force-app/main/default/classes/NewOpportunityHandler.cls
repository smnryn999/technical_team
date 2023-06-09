public class NewOpportunityHandler {
    public static void newOpp(List<Account> listAcc){
        
        List<Opportunity> listOpp = new List<Opportunity>();
        List<Account> accsWithOpp = [SELECT Id, Name, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN :listAcc];
        for(Account acc:accsWithOpp){
            if(acc.Opportunities.size()==0){
                Opportunity opp = new Opportunity(Name=acc.Name + ' Opportunity',
                                              StageName = 'Prospecting',
                                              CloseDate=Date.today().addMonths(1),
                                              AccountId = acc.Id);
                listOpp.add(opp);  
           }
        }
        insert listOpp;
    }
}