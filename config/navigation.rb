# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  
  navigation.items do |primary|
    primary.item :categories, 'Categories', categories_path do |cat|
      cat.item :courses, 'Courses', courses_path
    end
  end

end
