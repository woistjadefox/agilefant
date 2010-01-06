<%@ include file="../jsp/inc/_taglibs.jsp"%>
<%@ tag
  description="Constructs story tree starting from the given story node"%>

<%@ attribute type="fi.hut.soberit.agilefant.model.Story"
  name="node"%>
  <li storyid="${node.id}" storystate="${node.state}" rel="story">
    <a href="#"><ins style="display: none;">&nbsp;</ins>
    <%-- Used for filtering stories by text --%>
    <span class="storyFilter" style="display: none;"><c:out value="${fn:toLowerCase(node.name)}"/> <c:out value="${fn:toLowerCase(node.backlog.name)}"/></span>
    
    
    <div class="inlineTaskState taskState${node.state}" title="<aef:text name="story.state.${node.state}" />">${fn:substring(node.state, 0, 1)}</div>
    <c:out value="${node.name}" /><span style="font-size:80%" title="${node.backlog.name}">(<c:out value="${node.backlog.name}"/>)</span>
    </a>
    <c:if test="${!empty node.children}">
    <ul>
      <c:forEach items="${node.children}" var="childStory">
       <aef:storyTreeNode node="${childStory}"/>
      </c:forEach>
    </ul>
    </c:if>
  </li>