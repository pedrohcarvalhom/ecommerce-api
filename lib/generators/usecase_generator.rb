require 'rails/generators'

class UsecaseGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_usecase_file
    empty_directory(usecase_directory)
    template 'usecase_template.rb', File.join(usecase_directory, "#{file_name}_usecase.rb")
  end

  private

  def usecase_directory
    File.join('app', 'usecases', class_name.pluralize.downcase);
  end
end
