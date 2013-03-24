atom_feed do |feed|
  feed.title(@title ? @title : "Heritage")
  feed.updated(@stories.first.created_at) if @stories.any?
  @stories.each do |story|
    feed.entry(story) do |entry|
      entry.title(story.title)
      entry.content(story.description, :type => 'html')
      entry.author do |author|
        author.name "Fabien Penso"
      end
    end
  end
end
