<%@ tag description="instructorFeedbackEdit - feedback question feedback path settings" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="teammates.common.util.Const" %>
<%@ tag import="teammates.common.util.FieldValidator" %>
<%@ tag import="teammates.common.datatransfer.FeedbackParticipantType" %>

<%@ attribute name="fqForm" type="teammates.ui.template.FeedbackQuestionEditForm" required="true"%>

<div class="col-sm-12 padding-15px margin-bottom-15px background-color-light-green">
    <div class="col-sm-12 padding-0 margin-bottom-7px">
        <b class="feedback-path-title">Feedback Path</b> (Who is giving feedback about whom?)
    </div>
    <div class="col-sm-12 col-lg-6 padding-0 margin-bottom-7px"
        data-toggle="tooltip" data-placement="top"
        title="<%= Const.Tooltips.FEEDBACK_SESSION_GIVER %>">  
        <label class="col-sm-4 col-lg-5 control-label">
            Who will give the feedback:
        </label>
        <div class="col-sm-8 col-lg-7">
            <select class="form-control participantSelect"
                id="<%= Const.ParamsNames.FEEDBACK_QUESTION_GIVERTYPE %>${fqForm.questionNumberSuffix}"
                name="<%= Const.ParamsNames.FEEDBACK_QUESTION_GIVERTYPE %>"
                <c:if test="${!fqForm.editable}">disabled</c:if>
                onchange="feedbackGiverUpdateVisibilityOptions(this)">
                <c:forEach items="${fqForm.feedbackPathSettings.giverParticipantOptions}" var="option">
                    <option ${option.attributesToString}>
                        ${option.content}
                    </option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="col-sm-12 col-lg-6 padding-0 margin-bottom-7px" data-toggle="tooltip" data-placement="top"
        title="<%= Const.Tooltips.FEEDBACK_SESSION_RECIPIENT %>">
        <label class="col-sm-4 col-lg-5 control-label">
            Who the feedback is about:
        </label>
        <div class="col-sm-8 col-lg-7">
            <select class="form-control participantSelect"
                id="<%= Const.ParamsNames.FEEDBACK_QUESTION_RECIPIENTTYPE %>${fqForm.questionNumberSuffix}"
                name="<%= Const.ParamsNames.FEEDBACK_QUESTION_RECIPIENTTYPE %>"
                <c:if test="${!fqForm.editable}">disabled</c:if> onchange="feedbackRecipientUpdateVisibilityOptions(this);getVisibilityMessageIfPreviewIsActive(this);">
                <c:forEach items="${fqForm.feedbackPathSettings.recipientParticipantOptions}" var="option">
                    <option ${option.attributesToString}>
                        ${option.content}
                    </option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="col-sm-12 row numberOfEntitiesElements${fqForm.questionIndexIfNonZero}">
        <label id="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIES %>_text-${fqForm.questionIndexIfNonZero}" class="control-label col-sm-4 small">
            The maximum number of <span id="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIES %>_text_inner-${fqForm.questionIndexIfNonZero}"></span> each respondant should give feedback to:
        </label>
        <div class="col-sm-8 form-control-static">
            <div class="col-sm-4 col-md-3 col-lg-2 margin-bottom-7px">
                <input class="nonDestructive" type="radio"
                    name="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIESTYPE %>"
                    <c:if test="${fqForm.feedbackPathSettings.numberOfEntitiesToGiveFeedbackToChecked}">checked</c:if>
                    value="custom" <c:if test="${!fqForm.editable}">disabled</c:if>>
                <input class="nonDestructive numberOfEntitiesBox width-75-pc" type="number"
                    name="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIES %>"
                    id="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIES %>${fqForm.questionNumberSuffix}" 
                    value="${fqForm.feedbackPathSettings.numOfEntitiesToGiveFeedbackToValue}" 
                    min="1" max="250" <c:if test="${!fqForm.editable}">disabled</c:if>>
            </div>
            <div class="col-sm-4 col-md-3 col-lg-2 margin-bottom-7px">
                <input class="nonDestructive" type="radio"
                    name="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIESTYPE %>"
                    <c:if test="${!fqForm.feedbackPathSettings.numberOfEntitiesToGiveFeedbackToChecked}">checked</c:if>
                    value="max" <c:if test="${!fqForm.editable}">disabled</c:if>>
                <span class="">Unlimited</span>
            </div>
        </div>
    </div>
    <div class="row custom-feedback-paths-row">
        <input hidden class="custom-feedback-paths-spreadsheet-data-input"
               name="custom-feedback-paths-spreadsheet-data"
               value="${fqForm.feedbackPathSettings.customFeedbackPathsSpreadsheetData}">
        <div class="col-sm-12">
            <div class="row">
                <div class="col-sm-12">
                    <a class="toggle-custom-feedback-paths-display-link"
                       onclick="toggleCustomFeedbackPathsDisplay(this)">Show details and further customizations</a>
                </div>   
            </div>
            <div class="row custom-feedback-paths-display margin-top-15px">
                <div class="col-sm-3">
                    <p class="text-muted margin-top-15px"><strong>How to use:</strong></p>
                    <p class="text-muted">The spreadsheet to the right shows the current feedback paths according to the chosen options</p>
                    <p class="text-muted">Each row represents the feedback path of a single giver to a single recipient.</p>
                    <p class="text-muted">The first column contains the feedback giver and the second column contains the feedback recipient.</p>
                    <p class="text-muted">You can fully customize the paths by clicking on the button below.</p>
                    <button type="button" class="btn btn-primary btn-block customize-button">Customize</button>
                </div>
                <div class="col-sm-9">
                    <div class="row margin-bottom-15px">
                        <div class="col-sm-12">
                            <div class="custom-feedback-paths-spreadsheet"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="pull-right">                                    
                                <button class="btn btn-primary add-rows-button" type="button">Add</button>
                                <input type="number" class="form-control add-rows-input" value="10">
                                more rows at bottom                                
                            </div>
                        </div>
                    </div>
                </div>               
            </div>
        </div>
    </div>
</div>

<br>
