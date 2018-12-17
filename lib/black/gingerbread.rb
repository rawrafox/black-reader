require "json"

require "black/gingerbread/context"
require "black/gingerbread/refinements"

using Black::Gingerbread::Refinements

module Black
  module Gingerbread
    def self.dump(object)
      context = Black::Gingerbread::Context.new

      object.gingerbread_prepare_context(context)
      
      JSON.pretty_generate(object.gingerbread_prepare_json(context))
    end
  end
end
 