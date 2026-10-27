<%@tag description="base page template" pageEncoding="UTF-8"%>
<%@attribute name="pageTitle" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    <title>${pageTitle}</title>
</head>


<body>
<jsp:include page="/WEB-INF/pages/menu.jsp" />
<main class="container-fluid mt-5">
    <jsp:doBody/>
</main>
</body>
</html>