class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.artist.name = (name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end


  def note_contents=(contents)
    contents.each do |content|
      note = Note.create(content: content)
      self.notes << note
    end
  end

  def note_contents(note)
    note = Note.find(params[:id])
    note.content
  end






end
