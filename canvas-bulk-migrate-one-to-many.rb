require 'rest-client'

# The Canvas instance you'll be working with
CANVAS = ""

# An API token with sufficient privileges
TOKEN  = ""

# The Canvas course ID (not SIS ID) of the source course you'll be migrating
source = ""

# Array of SIS IDs you want the source course copied into
shells = []

shells.each do |sis_course_id|
  response = RestClient.post "#{CANVAS}/api/v1/courses/sis_course_id:#{sis_course_id}/content_migrations",
            { "migration_type" => "course_copy_importer",
              "settings[source_course_id]" => source },
              :Authorization => "Bearer #{TOKEN}"

  puts "Started migration into #{sis_course_id}"

end

