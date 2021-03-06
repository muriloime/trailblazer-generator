module Trailblazer
  # Trailblazer Generator
  class Generator
    # Generator commands registry
    module Commands
      # Generate Command
      module Generate
        # Generate Contract Command
        class Contract < Base
          desc "Generate a Trailblazer Contract"
          example ["Blog Create", "Blog Create --template=index", "Blog Create --layout=plural"]

          # Required Arguments
          argument :concept, required: true, desc: ARGUMENT_CONCEPT
          argument :name, required: true, desc: ARGUMENT_NAME

          # Optional Arguments
          option :template,              desc: OPTION_TEMPLATE
          option :layout,                desc: OPTION_LAYOUT, default: :singular
          option :json,                  desc: OPTION_JSON
          option :path,                  desc: OPTION_PATH
          option :stubs,                 desc: OPTION_STUBS
          option :add_type_to_namespace, desc: OPTION_ADD_TYPE_TO_NAMESPACE, type: :boolean
          option :app_dir,               desc: OPTION_APP_DIR
          option :concepts_folder,       desc: OPTION_CONCEPTS_FOLDER

          def call(concept:, **options)
            read_custom_options
            run_generator concept, :contract, options
            close_generator
          end
        end
      end
    end
  end
end
