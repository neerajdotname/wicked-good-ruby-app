module Screen
  class Speakers < PM::TableScreen
    title 'Speakers'

    def table_data
      [{
        cells: Speaker.all.map do |speaker|
          { title: speaker.name }
        end
      }]
    end
  end
end