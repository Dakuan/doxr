class Doxr::Document

  attr_reader :elements

  def initialize(file_path)
    @elements = []
    unzip file_path
    extract_styles
    extract_content
    FileUtils.rm_rf('.temp/')
  end

  private

  def get_doc(file_name)
    doc = false
    path = ".temp/word/#{file_name}.xml"
    File.open(path) { |file| doc = Nokogiri::XML(file).remove_namespaces! }
    raise "failed to open: #{path}" unless doc
    doc
  end

  def extract_styles
    doc = get_doc 'styles'
    puts doc.xpath("//latentStyles").children
  end

  def extract_content
    doc = get_doc 'document'
    doc.xpath("//p").each do |e|
      @elements << Doxr::Element.new(e)
    end
  end

  def unzip(file_path)
    Zip::ZipFile.open(file_path) do |zip_file|
      zip_file.each do |f|
        f_path=File.join('.temp/', f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      end
    end
  end
end