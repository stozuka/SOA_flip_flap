require 'csv'

# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data
  attr_accessor :str

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  # this method should take a String called `tsv` and convert
  # it into a data structure to store in `@data`.
  def take_tsv(tsv)
    @data = CSV.parse(tsv, {:headers=>true, :col_sep=>"\t"}).map(&:to_hash)
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    @str = ""
    @str << @data.first.collect {|k,v| k}.join("\t")
    @str << "\n"
    @str << @data.collect {|i| "#{i.collect{|k,v| v}.join("\t")}\n"}.join
    return @str
  end
end
