<?xml version="1.0" encoding="UTF-8"?>
<soap:Envelope
    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
		xmlns:h10="http://acms/H100i"
		xmlns:nfw="http://acms/NFWS106i"
    <% if (namespace !== false) { %> xmlns:ns1="<%= namespace%>"<%}%>
    <% if (header    !== false) { %>
        <% var ns_no = 2; %>
        <% _(header).each(function(single_header) { %>
            <% if (single_header.namespace !== void 0) { %>
                xmlns:ns<%= ns_no%>="<%=single_header.namespace%>"
            <% } %>
            <% ns_no++; %>
        <% }); %>
    <% } %>>

<% if (header !== false) { %>
<soap:Header>
    <% var ns_no = 2; %>
    <% _(header).each(function(single_header) { %>
        <<% if(single_header.namespace) {%>ns<%=ns_no%>:<%}%><%= single_header.name%>><%= single_header.value%></<% if(single_header.namespace) {%>ns<%=ns_no%>:<%}%><%= single_header.name%>>
        <% ns_no++; %>
    <% }); %>
</soap:Header>
<% } %>

<soap:Body>
    <% if (namespace !== false) {%><ns1:<%=method%>><% } else {%> <<%=method%>> <% } %>
        <% if (params !== false) {%><%= params%><% } %>
    <% if (namespace !== false) {%></ns1:<%=method%>><% } else { %> </<%=method%>> <% } %>
</soap:Body>
</soap:Envelope>
