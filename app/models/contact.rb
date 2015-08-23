
class Contact < ActiveRecord::Base
  # attr_accessible :first_name, :last_name, :email_address

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      contact = find_by_id(row["id"]) || new
      contact.attributes = row.to_hash.slice(*accessible_attributes)
      # contact.attributes = row.to_hash.slice(*row.to_hash.keys)
      contact.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, csv_options: {col_sep: ";"})
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  private

  def self.accessible_attributes
    [:first_name, :last_name, :email_address]
  end

end
