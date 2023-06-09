// When a new Case is created, if there is an existing case opened in the same origin by the account of the case,
// the old case should be determined as the Parent Case of the newly created case.

public class CaseHandler {
    public static void parentCase(List<Case> listCase){
        
        Set<Id> accIds = new Set<Id>();
        for(Case ca:listCase){
            accIds.add(ca.AccountId);
        }
        List<Case> currentCases = [SELECT id, Origin, AccountId FROM Case WHERE AccountId IN: accIds];
        
        for(Case ca:listCase){
            for(Case cas:currentCases){
                if(ca.AccountId == cas.AccountId && ca.Origin == cas.Origin){
                    ca.ParentId = cas.Id;
                }
            }
        }
    }
}