<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="java.util.Collections" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Jobs and Side Gigs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 850px;
            margin: 30px auto;
            padding: 20px;
            background: #f4f7f4;
            color: #26352b;
        }
        .card {
            background: white;
            padding: 22px;
            margin: 18px 0;
            border-radius: 12px;
            box-shadow: 0 2px 8px #00000010;
        }
        .job-type {
            color: #286b45;
            font-weight: bold;
        }
        .apply {
            background: #286b45;
            color: white;
            padding: 10px 14px;
            border: none;
            border-radius: 6px;
            cursor: default;
        }
        .back {
            display: inline-block;
            background: #286b45;
            color: white;
            padding: 12px 16px;
            border-radius: 6px;
            text-decoration: none;
        }
    </style>
</head>
<body>

<h1>Job and Side Gig Resources</h1>
<p>Explore part-time work and ways to earn extra money.</p>

<div class="card">
    <h2>Available Part-Time Jobs</h2>
    <p><em>Sample listings for this project demonstration. These are fictional, not verified openings.</em></p>
</div>

<div class="card">
    <h3>Part-Time Retail Associate</h3>
    <p class="job-type">Part-time | Retail</p>
    <p>Help customers, stock shelves, and organize products.</p>
    <p>Example schedule: 10–20 hours per week.</p>
    <button class="apply" type="button">Application Link</button>
</div>

<div class="card">
    <h3>Part-Time Restaurant Team Member</h3>
    <p class="job-type">Part-time | Food Service</p>
    <p>Assist with customer orders, food preparation, and cleaning.</p>
    <p>Example schedule: 10–18 hours per week.</p>
    <button class="apply" type="button">Application Link</button>
</div>

<div class="card">
    <h3>Part-Time Stockroom Assistant</h3>
    <p class="job-type">Part-time | Stocking</p>
    <p>Organize inventory, unpack deliveries, and prepare merchandise.</p>
    <p>Example schedule: 12–20 hours per week.</p>
    <button class="apply" type="button">Application Link</button>
</div>

<div class="card">
    <h3>Part-Time Customer Service Assistant</h3>
    <p class="job-type">Part-time | Customer Service</p>
    <p>Answer customer questions and help resolve basic issues.</p>
    <p>Example schedule: 10–20 hours per week.</p>
    <button class="apply" type="button">Application Link</button>
</div>

<%
    Set<String> interests = new LinkedHashSet<>();
    String[] chosen = request.getParameterValues("interests");

    if (chosen != null) {
        Collections.addAll(interests, chosen);
    }
%>

<div class="card">
    <h2>Side Gigs for Extra Money</h2>
    <p>Based on the interests you selected, here are some ways you could earn additional income.</p>

    <% if (interests.contains("pets")) { %>
        <h3>Pets</h3>
        <ul>
            <li><strong>Dog walking:</strong> Walk dogs for local pet owners.</li>
            <li><strong>Pet grooming:</strong> Explore pet bathing or grooming services with appropriate training.</li>
        </ul>
    <% } %>

    <% if (interests.contains("art")) { %>
        <h3>Art</h3>
        <ul>
            <li><strong>Selling crafts:</strong> Create and sell handmade decorations, art, or gifts.</li>
        </ul>
    <% } %>

    <% if (interests.contains("teaching")) { %>
        <h3>Teaching</h3>
        <ul>
            <li><strong>Tutoring:</strong> Help students learn a subject you know well.</li>
        </ul>
    <% } %>

    <% if (interests.contains("babysitting")) { %>
        <h3>Babysitting</h3>
        <ul>
            <li><strong>Babysitting:</strong> Provide childcare for families, with appropriate references and safety preparation.</li>
        </ul>
    <% } %>

    <% if (interests.contains("handiwork")) { %>
        <h3>Handiwork</h3>
        <ul>
            <li><strong>Taskrabbit:</strong> Explore eligible tasks such as furniture assembly or basic household help.</li>
        </ul>
    <% } %>

    <% if (interests.contains("yardwork")) { %>
        <h3>Yardwork</h3>
        <ul>
            <li><strong>Grass cutting:</strong> Offer lawn mowing and yard cleanup.</li>
            <li><strong>Gutter cleaning:</strong> Consider safe, suitable ground-level services or proper training.</li>
            <li><strong>Snow shoveling:</strong> Clear driveways and walkways during winter.</li>
        </ul>
    <% } %>

    <% if (interests.contains("driving")) { %>
        <h3>Driving</h3>
        <ul>
            <li><strong>Uber:</strong> Explore rideshare driving if eligible.</li>
            <li><strong>DoorDash:</strong> Explore delivery work if available in your area.</li>
        </ul>
    <% } %>

    <% if (interests.isEmpty()) { %>
        <p>No interests were received. Return to the budget form and select at least three interests.</p>
    <% } %>
</div>

<a class="back" href="index.jsp">Back to Budget Form</a>

</body>
</html>
