class Category < ActiveRecord::Base
  has_ancestry
  has_one :budget
  require 'csv'

  def self.create_if_not_exists(name, parent, budget)
    if parent.nil?
      if Category.find_by_name(name).nil?
        return Category.create! :name => name, :parent => parent, :budget_id => budget
      else
        return Category.find_by_name(name)
      end
    else
      for kid in parent.children do
        puts kid.name
        puts name
        if kid.name == name
          return kid
        end
      end
    
      Category.create! :name => name, :parent => parent, :budget_id => budget
    end
  end

  def sanitize_name
    temp = self.name.gsub(/[0-9](.[0-9])*/,'')
    temp = temp.gsub(/ \(.*\)/,'')
    temp = temp.gsub(/_/,' ')
    temp = temp.gsub(/\.csv/,'')
    # Arts, Culture & Heri Adv & Fnd"
    # Neighbourhood&Recreation Serv"
    # Rec&Neighbourhood Serv"
    # Bus. Plan. & Cont. Improvement
    # Corporate, Oper & Council Serv

  end

  def import_csv(csvfile)
    budget = self.budget_id
    current = self
    root = current
    CSV.foreach(Rails.root.join('public', 'uploads', csvfile), :headers => true) do |row|
    # use row here...
      puts "header: #{row.headers}"
      puts "Row: #{row}"
      
      row.headers.each do |item|
        puts "item: #{item}"
        unless row[item].nil?
          if item != "EXPENDITURE" && item != "REVENUE"
            #create a category if it exists
            puts "creating a new category"
             current = Category.create_if_not_exists(row[item], current, budget)
          elsif item == "EXPENDITURE"
            puts "add expenditure #{row[item]} to #{Category.last.name}"
            #c = Category.last
            current.expenditure = row[item].to_i
            current.save
          elsif item == "REVENUE"
            puts "add revenue #{row[item]} to #{Category.last.name}"
            #c = Category.last
            current.revenue = row[item].to_i
            current.save
            current = root
          end
        end
      end
    end
    self.total_exp
    self.total_rev

    return root
  end

  def to_string(depth)
    (5*depth).times{putc " "}
    c = self
    puts "#{c.name} #{c.expenditure} #{c.revenue}\n"
    c.children.each do |cat|
      cat.to_string(depth+1)
    end
  end

  def total_exp
    if self.is_childless?
      return self.expenditure
    else
      self.children.each do |cat|
        cat.total_exp
      end
      total = 0
      self.children.each do |cat|
        total += cat.expenditure
      end
      self.expenditure = total
      self.save
      return total
    end
  end

  def total_rev
    if self.is_childless?
      puts self.name
      puts self.revenue
      return self.revenue
    else
      self.children.each do |cat|
        cat.total_rev
      end
      total = 0
      self.children.each do |cat|
        total += cat.revenue
      end
      self.revenue = total
      self.save
      return total
    end
  end

  def self.testme
    c = Category.import_csv
    c.to_string(0)

  end

end
