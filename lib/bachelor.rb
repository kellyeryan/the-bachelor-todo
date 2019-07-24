require 'pry'

def get_first_name_of_season_winner(data, season)
  data[season].each do |people|
    people.each do |key, value|
      if value == "Winner"
        first_name = people["name"]
        return first_name.split(' ').first
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |_season, infos|
    infos.each do |key|
      if key["occupation"] == occupation
        return key["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |_season, infos|
    infos.each do |key|
      if key["hometown"] == hometown
        count += 1
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  data.each do |_season, infos|
    infos.each do |key|
      return key['occupation'] if key['hometown'] == hometown
    end
  end
end

def get_average_age_for_season(data, season)
  ages = data[season].map do |contestant|
    contestant["age"].to_i
  end
  (ages.sum / ages.length.to_f).round
end
