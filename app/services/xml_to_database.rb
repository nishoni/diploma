class XmlToDatabase
  attr_accessor :file, :parsed_file, :user_id

  def initialize(file:, user_id:)
    @file = file
  end

  def perform
    @db_version = DbVersion.new
    @db_version.version = DbVersion.last.version + 1
    @db_version.user_id = user_id
    created_items = 0

    @parsed_file = Nokogiri::XML(File.open(file[:file]))

    parsed_file.xpath("//DATA").each do |data|
      if xml_items_by_csl_id[data.xpath("CSL_ID").children.to_s.to_i]
        xml_item = xml_items_by_csl_id[data.xpath("CSL_ID").children.to_s.to_i]
      else
        created_items += 1
        xml_item = XmlItem.new
      end

      xml_item.csl_id = data.xpath("CSL_ID").children.to_s.to_i
      xml_item.first_name = data.xpath("FIRST_NAME").children.to_s
      xml_item.last_name = data.xpath("LAST_NAME").children.to_s
      xml_item.birth_date = data.xpath("//DOB")[0].children.to_s.to_date
      xml_item.place_of_birth = data.xpath("//POB")[0].children.to_s

      xml_item.aliases ||= []
      data.xpath("ALIAS_LIST").children.select { |item| item.children.presence }.each do |item_alias|
        xml_item.aliases << {
          first_name: item_alias.xpath("FIRST_NAME").children.to_s.presence || xml_item.first_name,
          last_name: item_alias.xpath("LAST_NAME").children.to_s.presence || xml_item.last_name
        }
      end

      xml_item.roles ||= []
      data.xpath("ROLE_LIST").children.select { |item| item.children.presence }.each do |item_role|
        xml_item.roles << {
          title: item_role.xpath("TITLE").children.to_s
        }
      end

      xml_item.save!
    end

    @db_version.new_items_created = created_items
    @db_version.current = true
    @db_vesion.save!
    DbVersion.last.update(current: false)
  end

  private

  def xml_items_by_csl_id
    @xml_items_by_csl_id ||= XmlItem.all.index_by(&:csl_id)
  end
end