require "http"

response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json?$limit=32000")
  
workers = response.parse(:json)

names = workers

# Name of all workers
# i = 0
# while i < names.length
#   p names[i]["name"]
#   i += 1
# end

# Name, salary, Department, Job Title, assorted by salary
i = 0
arr = []
while i < names.length
  if names[i]["annual_salary"] != nil
    arr << names[i]["annual_salary"] + ", " + names[i]["name"] + ", " + names[i]["department"] + ", " + names[i]["job_titles"]
  end
  i += 1
end
p arr.sort

# Average Police Officer Salary
i = 0
arr = []
while i < names.length
  if names[i]["annual_salary"] != nil
    if names[i]["job_titles"] == "POLICE OFFICER"
      arr << names[i]["annual_salary"].to_i
    end
  end
  i += 1
end
sum = arr.sum
average = sum / arr.length
p "The average Chicago Police Officer salary is #{average}"

# Average Fire Department Salary
i = 0
arr = []
while i < names.length
  if names[i]["annual_salary"] != nil
    if names[i]["department"] == "FIRE"
      arr << names[i]["annual_salary"].to_i
    end
  end
  i += 1
end
sum = arr.sum
average = sum / arr.length
p "The average Chicago Fire Department annual salary is #{average}"

# Mayors Salary
i = 0
arr = []
while i < names.length
  if names[i]["annual_salary"] != nil
    if names[i]["job_titles"] == "MAYOR"
      arr << names[i]["annual_salary"] + ", " + names[i]["name"] + ", " + names[i]["department"] + ", " + names[i]["job_titles"]
    end
  end
  i += 1
end
p arr