---
layout: page
title: Tags
permalink: /tags/
---

The following list includes all the tags existing in the blog:
<ul>
{% for tag in site.tags %}
  <li><a href="{{ site.baseurl }}/tags/{{ tag[0] }}">{{ tag[0] }}</a></li>
{% endfor %}
</ul>