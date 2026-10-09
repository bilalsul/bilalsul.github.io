---
layout: page
title: Archives
permalink: /archives/
---

{% assign posts_by_year = site.posts | group_by_exp: "post", "post.date | date: '%Y'" %}
{% for year_group in posts_by_year %}
<h2><a href="{{ '/archives/year/' | append: year_group.name | append: '/' | relative_url }}">{{ year_group.name }}</a></h2>
{% assign posts_by_month = year_group.items | group_by_exp: "post", "post.date | date: '%m'" %}
<ul>
{% for month_group in posts_by_month %}
  {% assign month_date = month_group.items.first.date %}
  <li><a href="{{ '/archives/month/' | append: year_group.name | append: '-' | append: month_group.name | append: '/' | relative_url }}">{{ month_date | date: "%B" }} ({{ month_group.items.size }})</a></li>
{% endfor %}
</ul>
{% endfor %}
