module JobsHelper

  def render_job_status(job)
    if job.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
    end
  end

  def display_job_status(job)
    case job.status
    when "full_time"
      "全职"
    when "part_time"
      "兼职"
    else
      "实习"
    end
  end
end
