# frozen_string_literal: true

module TestHelper
  def attach_image(record, association, filename)
    record.send(association).attach(
      io: File.open("spec/fixtures/files/#{filename}"),
      filename: filename,
      content_type: 'image/jpeg'
    )
    record.save!
  end
end
