module AsHelper
  def updated_at_column(record, column)
    "#{time_ago_in_words(record.created_at)} ago"
  end
  def created_at_column(record, column)
    "#{time_ago_in_words(record.created_at)} ago"
  end
end

