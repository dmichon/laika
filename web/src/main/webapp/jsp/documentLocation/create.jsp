<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Clinical Document Upload</title>

<script type="text/javascript" src="<c:url value="javascripts/wufoo.js"/>"/>
<script type="text/javascript" src="<c:url value="javascripts/prototype.js"/>"/>
<script type="text/javascript" src="<c:url value="javascripts/documentLocation.js"/>"/>
<link rel="stylesheet" href="<c:url value="css/structure.css"/>" type="text/css" />
<link rel="stylesheet" href="<c:url value="css/form.css"/>" type="text/css" />
<link rel="stylesheet" href="<c:url value="css/theme.css"/>" type="text/css" />
</head>
<body>
    <img id="top" src="<c:url value="/images/top.png"/>" alt=""/>
    <div id="container">
        <h1><a id="logo" href="">Laika</a></h1>
        <form:form commandName="documentLocation" cssClass="wufoo">
        <form:errors path="*" cssClass="errorBox" />
            <jsp:include page="../partials/header.jsp"/>
            <div class="info">
                <h2>Create a document location</h2>
                <p>Create a pointer to a location in a clinical document using XPath</p>
            </div>
            <ul>
                <c:if test="${param['cd_id'] != null}">
                    <form:hidden path="id"/>
                </c:if>
                <li>
                <label class="desc">Name <span class="req">*</span></label>
                    <div>
                        <form:input path="name" cssClass="field text small" maxlength="255"/>
                    </div>
                </li>
                <li>
                <label class="desc">XPath Expression <span class="req">*</span></label>
                    <div>
                        <form:input path="xpathExpression" cssClass="field text large" maxlength="255"/>
                    </div>
                    
                    <p class="instruct">Enter an XPath expression that will select the portion of the document that is of 
                                        interest. Variables should be defined so that values at the documents location
                                        can be inspected by testers.</p>
                </li>
                <li>
                <label class="desc">Description</label>
                    <div>
                        <form:textarea path="description" cssClass="field textarea medium" rows="10" cols="40"/>
                    </div>
                    
                    <p class="instruct">Enter a description of this document location.</p>
                </li>


                <c:forEach items="${documentLocation.namespaces}" varStatus="nsIndex">
                <li class="nsForm">
                <label class="desc" for="">Namespace</label>
                    <form:hidden path="namespaces[${nsIndex.index}].id"/>
                    <span>
                        <form:input path="namespaces[${nsIndex.index}].prefix" cssClass="field text medium" maxlength="255"/>
                        <label>Prefix</label>
                    </span>
                    <span>
                        <form:input path="namespaces[${nsIndex.index}].uri" cssClass="field text medium" maxlength="255"/>
                        <label>URI</label>
                    </span>
                </li>
                </c:forEach>

                <li id="nsInserter" class="buttons">
                    <input id="nsInserter" class="btTxt" type="button" value="Add Namespace" onclick="insertNamespace()"/>
                </li>

                <li class="buttons">
                    <input id="saveForm" class="btTxt" type="submit" value="Create" />
                </li>
            </ul>
        </form:form>
    </div>
    <img id="bottom" src="images/bottom.png" alt="" />
    <textarea id="namespaceTemplate" style="display: none;">
    <jsp:text>
    <![CDATA[
        <li class="nsForm">
        <label class="desc" for="">Namespace</label>
            <span>
                <input id="namespaces[#{nsIndex}].prefix" name="namespaces[#{nsIndex}].prefix" class="field text medium" type="text" value="" maxlength="255"/>
                <label>Prefix</label>
            </span>
            <span>
                <input id="namespaces[#{nsIndex}].uri" name="namespaces[#{nsIndex}].uri" class="field text medium" type="text" value="" maxlength="255"/>
                <label>URI</label>
            </span>
        </li>
        ]]>
    </jsp:text>
    </textarea>
</body>
</html>