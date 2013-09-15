module ApplicationHelper

  def sort_link_to(title, field)
    link_to title, params.merge(:order => field, :desc => @desc, :page => 1)
  end

  def rating_stars(rating)
    case rating
    when 0
      "#{empty_star}" * 5
    when 0.5
      half_star + ("#{empty_star}" * 4)
    when 1
      full_star + ("#{empty_star}" * 4)
    when 1.5
      full_star + half_star + ("#{empty_star}" * 3)
    when 2
      ("#{full_star}" *2) + ("#{empty_star}" * 3)
    when 2.5
      ("#{full_star}" *2) + half_star + ("#{empty_star}" * 2)
    when 3
      ("#{full_star}" *3) + ("#{empty_star}" * 2)
    when 3.5
      ("#{full_star}" *3) + half_star + ("#{empty_star}" * 1)
    when 4
      ("#{full_star}" *4) + empty_star
    when 4.5
      ("#{full_star}" *4) + half_star
    when 5
      "#{full_star}" *5
    end
  end

  def empty_star
    '<i class="icon-star-empty" />'
  end

  def half_star
    '<i class="icon-star-half-empty" />'
  end

  def full_star
    '<i class="icon-star" />'
  end

  def edit_icon
    '<i class="icon-edit" />'
  end

  def delete_icon
    '<i class="icon-star" />'
  end

end
