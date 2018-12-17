require "black/object"

module Black
  module Gingerbread
    module Refinements
      refine ::Object do
        def gingerbread_prepare_context(_)
        end

        def gingerbread_prepare_json(_)
          self
        end
      end
      
      refine ::Array do
        def gingerbread_prepare_context(context)
          self.each { |e| e.gingerbread_prepare_context(context) }
        end
        
        def gingerbread_prepare_json(context)
          self.map { |e| e.gingerbread_prepare_json(context) }
        end
      end

      refine ::Float do
        def gingerbread_prepare_json(context)
          if self.infinite?
            if self > 0
              { "_type": "_FloatPositiveInfinity" }
            else
              { "_type": "_FloatNegativeInfinity" }
            end
          elsif self.nan?
            { "_type": "_FloatNaN" }
          else
            self
          end
        end
      end

      refine ::Hash do
        def gingerbread_prepare_context(context)
          self.each do |k, v|
            raise Exception, k.inspect unless k.is_a?(String)

            v.gingerbread_prepare_context(context)
          end
        end
        
        def gingerbread_prepare_json(context)
          self.map { |k, v| [k, v.gingerbread_prepare_json(context)] }.to_h
        end
      end

      refine Black::Object do
        def gingerbread_prepare_context(context)
          context.count_object(self)

          self.instance_variables.each do |variable|
            self.instance_variable_get(variable).gingerbread_prepare_context(context)
          end
        end

        def gingerbread_prepare_json(context)
          object_id = self.object_id

          if context.ids.key?(object_id)
            { "_ref" => context.ids.fetch(object_id) }
          else
            result = Hash.new

            if context.objects.fetch(object_id) > 1
              context.ids[object_id] = result["_id"] = context.generate_id
            end

            result["_type"] = self.class.constructor_name

            self.instance_variables.each do |variable|
              key = variable[1 ..]
              value = self.instance_variable_get(variable)

              result[key] = value.gingerbread_prepare_json(context)
            end

            result
          end
        end
      end
    end
  end
end
