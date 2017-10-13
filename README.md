
We use get() rather than all(), because it’s makes it clear these are routes that are fetched by users rather than submitted with new data

We'll be using Stencil to generate HTML:
put no HTML in your Swift unless you specifically want to generate it dynamically.

Because we’re going to be using next() in every route, I find it easier to use Swift’s defer keyword to ensure that next() always gets run. 

	router.get("/") {
    	request, response, next in
   		defer { next() }
    	try response.render("home", context: [:])
	}

This is how we're going to include e.g. header files:

	{% include “header.stencil” %

See link for a breif introduction on how to get started with the Kitura Stencil:
http://masteringswift.blogspot.no/2017/02/getting-started-with-kitura-stencil.html}

Now we want to do something fun; inheritance
We need to create a file, called master.stencil, which contains the following code:
<html>
	<head>
    	<title>{% block title %}{% endblock %} - Million Hairs</title>
	</head>
	<body>
		{% include "header.stencil"%}
		{% block body %}{% endblock %}
		{% include "footer.stencil" %}
	</body>
</html>

#We're using "block" NAME to describe the part we're going to work on. I.E.: {% blcok NAME %} <h1>Some Code</h1> {% endblock %}

We need to tell swift / kitura stencil what file we want to to be working with. We're doing so by typing the following line
{% extends "master.stencil" %}

Country list:
https://github.com/winmarkltd/BootstrapFormHelpers/blob/d4201db1003de3b5b5eca3ea6d69efa6dde8497b/js/lang/en_US/bootstrap-formhelpers-countries.en_US.js


