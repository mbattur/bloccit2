class Label < ActiveRecord::Base
 has_many :labelings
 belongs_to :labelable, polymorphic: true
 has_many :topics, through: :labelings, source: :labelable, source_type: :Topic
 has_many :posts, through: :labelings, source: :labelable, source_type: :Post

 def self.update_labels(label_string)
     new_labels = []

     unless label_string.nil? || label_string.empty?
     #the method will not execute if the label_string is nil or empty
     #can you explain what's label_string is nil?

       label_string.split(",").each do |label|
        #splitting the label string to store them in backed
       label_name = label.strip
       #it strips the label's white spaces.
       new_label = Label.find_or_create_by(name: label_name)
       #calling find_or_create by label name so there won't be any duplicates.
       new_labels << new_label
       #adding new label to label list
       end
     end
     new_labels
     #returning updated label list. 
 end
end