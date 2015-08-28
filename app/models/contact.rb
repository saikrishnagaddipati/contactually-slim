
class Contact < ActiveRecord::Base

  # the following hash maps our column headers to database columns
  MAPPING = {
      "First Name" => "first_name",
      "Last Name" => "last_name",
      "Email Address" => "email_address",
      "Company Name" => "company_name",
      "Phone Number" => "phone_number"
  }

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    # assume row one is always the header
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # Convert the keys from the csv to match the database column names
      row.keys.each { |k| row[ MAPPING[k] ] = row.delete(k) if MAPPING[k] }
      create row
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      # using a tab seperated .csv file, so specify seperator as a tab with \t
      when ".csv" then Roo::CSV.new(file.path, csv_options: {col_sep: "\t"})
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
