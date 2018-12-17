module Black
  module Gingerbread
    class Context
      attr_reader :ids
      attr_reader :objects

      def initialize
        @ids = {}
        @next_id = 0
        @objects = {}
      end

      def count_object(object)
        object_id = object.object_id

        @objects[object_id] = @objects.fetch(object_id, 0) + 1
      end

      def generate_id
        @next_id.tap { @next_id += 1 }
      end
    end
  end
end
