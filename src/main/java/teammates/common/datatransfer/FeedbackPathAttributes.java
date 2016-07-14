package teammates.common.datatransfer;

import java.util.List;

import teammates.storage.entity.FeedbackPath;

public class FeedbackPathAttributes extends EntityAttributes {

    private String giver;
    private String recipient;
    
    public FeedbackPathAttributes(String giver, String recipient) {
        this.giver = giver;
        this.recipient = recipient;
    }
    
    public FeedbackPathAttributes(FeedbackPath feedbackPath) {
        this.giver = feedbackPath.getGiver();
        this.recipient = feedbackPath.getRecipient();
    }
    
    public String getGiver() {
        return giver;
    }
    
    public String getRecipient() {
        return recipient;
    }
    
    @Override
    public List<String> getInvalidityInfo() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public FeedbackPath toEntity() {
        return new FeedbackPath(giver, recipient);
    }

    @Override
    public String getIdentificationString() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public String getEntityTypeAsString() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public String getBackupIdentifier() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public String getJsonString() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void sanitizeForSaving() {
        // TODO Auto-generated method stub
        
    }
}
