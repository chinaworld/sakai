<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://sakaiproject.org/jsf/sakai" prefix="sakai" %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<f:loadBundle basename="org.sakaiproject.tool.podcaster.bundle.Messages" var="msgs"/>

<f:view>
  <sakai:view>
    <link href="./css/podcaster.css" type="text/css" rel="stylesheet" media="all" />

      <!--  TODO: figure out why it is not finding this -->
      <script type="text/javascript" src="/library/calendar/js/calendar2.js" language="JavaScript" ></script>
      
  <h:form id="podAdd" enctype="multipart/form-data">

    <div>  <!-- Page title and Instructions -->
      <h3><h:outputText value="#{msgs.podcast_add_title}" /></h3>
      <div class="indnt1">
          <p class="instruction"> 
            <h:outputText value="#{msgs.podcast_add_directions}" />
 	        <br /><br />
            <h:outputText value="#{msgs.podcast_required_prompt}" />
            <span class="reqStarInline">*</span>
          </p>
 	  </div>
    </div>
    <br />

    <div class="indnt1">  <!-- Choose a file -->
      <span class="reqStarInline">*</span>
 	  <h:outputText value="#{msgs.podcast_file_prompt}" styleClass="reqPrompt" />
 	  <sakai:inputFileUpload id="podfile" valueChangeListener="#{podcastBean.processFileUpload}" 
 	     styleClass="indnt1" size="35" />

      <h:message for="podfile" styleClass="alertmessage"/>
    </div>
    <br />

    <div class="indnt1">  <!-- Date -->
      <span class="reqStarInline">*</span>
      <h:outputText value="#{msgs.podcast_date_prompt}" styleClass="reqPrompt" />

      <sakai:input_date id="poddate" value="#{podcastBean.date}" showDate="true" rendered="true" />

      <h:message for="poddate" styleClass="alertmessage" />
    </div>
    <br />
     
    <div class="indnt1">  <!-- Title -->
      <span class="reqStarInline">*</span>
      <h:outputText value="#{msgs.podcast_title_prompt}" styleClass="reqPrompt" />
 	  <h:inputText id="podtitle" value="#{podcastBean.title}" styleClass="indnt3" size="35" />

      <h:message for="podtitle" styleClass="alertmessage" />
    </div>
    <br />

    <div class="indnt1"> <!-- Description -->
      <h:outputText value="#{msgs.podcast_add_description_prompt}" styleClass="reqPrompt" />
      <br />
      <h:inputTextarea value="#{podcastBean.description}" rows="6" cols="80" />
    </div>
    <br />

    <div class="indnt1"> <!-- Email Notification -->
      <h:outputText value="#{msgs.podcast_add_email_prompt}" />
      <h:selectOneMenu value="#{podcastBean.email}">
          <f:selectItems value="#{podcastBean.emailItems}" />
      </h:selectOneMenu>
      
    </div>
    <br />

    <div class="act">  <!-- Add and Cancel buttons -->
      <h:commandButton type="submit" value="#{msgs.podcast_add}" styleClass="active" />
      <h:commandButton type="submit" value="#{msgs.podcast_cancel}" action="cancel" 
             immediate="true" styleClass="reqPrompt" />
    </div>
  </h:form>
 </sakai:view>
</f:view>