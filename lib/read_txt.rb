# frozen_string_literal: true

module ReadTxt
  def img_file(file_name)
    path = File.join(File.dirname(__FILE__), '../img', file_name)
    File.read(path)
  end
end
