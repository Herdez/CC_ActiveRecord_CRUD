# Este archivo sirve para crear registros de prueba
module TaskSeeds

  def self.import(filename=File.dirname(__FILE__) + "/../tasks.csv")
    field_names = nil
    Task.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          p attribute_hash
          Task.create!(attribute_hash)
        end
      end
    end
  end
end