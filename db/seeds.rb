# 3.times do |topic|
#   Topic.create!(
#     title: "Topic #{topic}"
# )
# end

# puts "3 Topics created"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body:  "Nam nisl mauris, tristique sed enim et, porta ullamcorper ligula. Nulla pulvinar lectus in auctor auctor. Maecenas accumsan, nisl at luctus feugiat, augue ante porttitor ante, eget cursus purus libero at enim. Sed in interdum felis. Duis at fringilla velit. Duis sit amet diam eget lorem tempus sagittis et pretium orci. Mauris vitae blandit nunc. Vivamus cursus mollis ex eget sollicitudin. Nulla facilisi. Aliquam varius risus in orci malesuada tempus. Nulla condimentum enim sit amet varius porttitor. Aenean ut risus maximus, bibendum dolor id, lacinia augue. Sed vulputate vulputate erat quis elementum. Proin vitae ante quis tellus commodo ultricies. Quisque rutrum, eros sed malesuada posuere, massa felis efficitur arcu, sed posuere dui urna sed turpis. "
    # topic_id: Topic.last.id
  )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
  percent_utilized: 15
  )
end


puts "5 skills created"

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "My great service",
    body: "Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC",
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200"
  )
end

puts "9 portfolio items created"

