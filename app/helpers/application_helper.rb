module ApplicationHelper
  def star_list
    star_list = Array.new
    star_list[0] = ["1", "1"]
    star_list[1] = ["2", "2"]
    star_list[2] = ["3", "3"]
    star_list[3] = ["4", "4"]
    star_list[3] = ["5", "5"]
    star_list
    #will return array like this     [["Mr", "Mr"], ["Ms", "Ms"], ["Mrs", "Mrs"]] 
  end
  
end
