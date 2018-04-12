json.call(@lesson_plan, :id, :lessons_count)
json.duration_in_words @lesson_plan.duration.in_words
json.lessons @lesson_plan.lesson_plan_lessons.published do |lesson_plan_lesson|
  json.position lesson_plan_lesson.position
  json.id lesson_plan_lesson.id
  lesson = lesson_plan_lesson.lesson
  json.name lesson.topic.name
  json.duration lesson.duration.in_words
  if lesson.topic.icon
    json.rendered_icon link_to image_tag(lesson.topic.icon.url), [lesson.topic, lesson]
  end
  json.difficulty_tag difficulty_tag(lesson.level_id)
end
json.links do
  json.download lesson_plan_path(@lesson_plan, format: "zip")
end
